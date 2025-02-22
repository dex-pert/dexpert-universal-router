// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

import {DeployUniversalRouter} from '../DeployUniversalRouter.s.sol';
import {RouterParameters} from 'contracts/base/RouterImmutables.sol';

contract DeployMainnet is DeployUniversalRouter {
    function setUp() public override {
        params = RouterParameters({
            uniswapV2Router02: 0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D,
            feeRecipient: 0x7002421C457b83425293DE5a7BFEB68B01A6f693,
            feeBaseBps: 10000,
            permit2: 0x000000000022D473030F116dDEE9F6B43aC78BA3,
            weth9: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2,
            v2Factory: 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f,
            v3Factory: 0x1F98431c8aD98523631AE4a59f267346ea31F984,
            pairInitCodeHash: 0x96e8ac4277198ff8b6f785478aa9a39f403cb768dd02cbee326c3e7da348845f,
            poolInitCodeHash: 0xe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b54
        });

        unsupported = 0x76D631990d505E4e5b432EEDB852A60897824D68;
    }
}
