// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import {DeployUniversalRouter} from '../DeployUniversalRouter.s.sol';
import {RouterParameters} from 'contracts/base/RouterImmutables.sol';

contract DeployCelo is DeployUniversalRouter {
    function setUp() public override {
        params = RouterParameters({
            uniswapV2Router02: 0x464c7Bb0d5DA8189fD140f153535932d291F7f97,
            feeRecipient: 0x464c7Bb0d5DA8189fD140f153535932d291F7f97,
            feeBaseBps: 10000,
            permit2: 0x000000000022D473030F116dDEE9F6B43aC78BA3,
            weth9: UNSUPPORTED_PROTOCOL,
            v2Factory: 0x79a530c8e2fA8748B7B40dd3629C0520c2cCf03f,
            v3Factory: 0xAfE208a311B21f13EF87E33A90049fC17A7acDEc,
            pairInitCodeHash: 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f,
            poolInitCodeHash: 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54
        });

        unsupported = 0x5Dc88340E1c5c6366864Ee415d6034cadd1A9897;
    }
}
