// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import {DeployUniversalRouter} from '../DeployUniversalRouter.s.sol';
import {RouterParameters} from 'contracts/base/RouterImmutables.sol';

contract DeployCeloAlfajores is DeployUniversalRouter {
    function setUp() public override {
        params = RouterParameters({
            uniswapV2Router02: 0x464c7Bb0d5DA8189fD140f153535932d291F7f97,
            feeRecipient: 0x464c7Bb0d5DA8189fD140f153535932d291F7f97,
            feeBaseBps: 10000,
            permit2: 0x000000000022D473030F116dDEE9F6B43aC78BA3,
            weth9: UNSUPPORTED_PROTOCOL,
            v2Factory: UNSUPPORTED_PROTOCOL,
            v3Factory: 0xAfE208a311B21f13EF87E33A90049fC17A7acDEc,
            pairInitCodeHash: BYTES32_ZERO,
            poolInitCodeHash: 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54
        });

        unsupported = 0x5302086A3a25d473aAbBd0356eFf8Dd811a4d89B;
    }
}
