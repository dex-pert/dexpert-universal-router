// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import 'forge-std/console2.sol';
import 'forge-std/Script.sol';
import {RouterParameters} from 'contracts/base/RouterImmutables.sol';
import {UnsupportedProtocol} from 'contracts/deploy/UnsupportedProtocol.sol';
import {DexpertUniversalRouter} from 'contracts/DexpertUniversalRouter.sol';
import {Permit2} from 'permit2/src/Permit2.sol';

bytes32 constant SALT = bytes32(uint256(0x00000000000000000000000000000000000000005eb67581652632000a6cbedf));

abstract contract DeployUniversalRouter is Script {
    RouterParameters internal params;
    address internal unsupported;

    address constant UNSUPPORTED_PROTOCOL = address(0);
    bytes32 constant BYTES32_ZERO = bytes32(0);

    // set values for params and unsupported
    function setUp() public virtual;

    function run() external returns (DexpertUniversalRouter router) {
        vm.startBroadcast();

        // deploy permit2 if it isnt yet deployed
        if (params.permit2 == address(0)) {
            address permit2 = address(new Permit2{salt: SALT}());
            params.permit2 = permit2;
            console2.log('Permit2 Deployed:', address(permit2));
        }

        // only deploy unsupported if this chain doesn't already have one
        if (unsupported == address(0)) {
            unsupported = address(new UnsupportedProtocol());
            console2.log('UnsupportedProtocol deployed:', unsupported);
        }

        params = RouterParameters({
            uniswapV2Router02: params.uniswapV2Router02,
            feeRecipient: mapUnsupported(params.feeRecipient),
            feeBaseBps: params.feeBaseBps,
            permit2: mapUnsupported(params.permit2),
            weth9: mapUnsupported(params.weth9),
            v2Factory: mapUnsupported(params.v2Factory),
            v3Factory: mapUnsupported(params.v3Factory),
            pairInitCodeHash: params.pairInitCodeHash,
            poolInitCodeHash: params.poolInitCodeHash
        });

        logParams();

        router = new DexpertUniversalRouter(params);
        router.setFeeBps(1, 0, 20);
        router.setFeeBps(1, 1, 50);
        router.setFeeBps(2, 0, 10);
        router.setFeeBps(2, 1, 25);
        console2.log('Universal Router Deployed:', address(router));
        vm.stopBroadcast();
    }

    function logParams() internal view {
        console2.log('uniswapV2Router02:', params.uniswapV2Router02);
        console2.log('feeRecipient:', params.feeRecipient);
        console2.log('feeBaseBps:', params.feeBaseBps);
        console2.log('permit2:', params.permit2);
        console2.log('weth9:', params.weth9);
        console2.log('v2Factory:', params.v2Factory);
        console2.log('v3Factory:', params.v3Factory);
    }

    function mapUnsupported(address protocol) internal view returns (address) {
        return protocol == address(0) ? unsupported : protocol;
    }
}
