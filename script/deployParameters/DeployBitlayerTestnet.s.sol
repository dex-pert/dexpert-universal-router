// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import {DeployUniversalRouter} from '../DeployUniversalRouter.s.sol';
import {RouterParameters} from 'contracts/base/RouterImmutables.sol';

contract DeploySepolia is DeployUniversalRouter {
    function setUp() public override {
        params = RouterParameters({
            uniswapV2Router02: 0x6239cA7C648EEC451f1152BEfb003eB322139455,
            feeRecipient: 0x464c7Bb0d5DA8189fD140f153535932d291F7f97,
            feeBaseBps: 1000,
            permit2: 0x0000000000000000000000000000000000000000,
            weth9: 0x3e57d6946f893314324C975AA9CEBBdF3232967E,
            v2Factory: 0x6239cA7C648EEC451f1152BEfb003eB322139455,
            v3Factory: 0x6239cA7C648EEC451f1152BEfb003eB322139455,
            pairInitCodeHash: 0xb973af6ae6e11ca15a8cf0e1bc593fe6f28e07534b7e8eefc7642bcf048b54da,
            poolInitCodeHash: 0xb973af6ae6e11ca15a8cf0e1bc593fe6f28e07534b7e8eefc7642bcf048b54da
        });

        unsupported = 0x0000000000000000000000000000000000000000;
    }
}
