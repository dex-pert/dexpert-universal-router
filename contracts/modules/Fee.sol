// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.17;

import {IWETH9} from '../interfaces/external/IWETH9.sol';
import {IAllowanceTransfer} from 'permit2/src/interfaces/IAllowanceTransfer.sol';

struct FeeParameters {
    address feeRecipient;

    uint256 feeBaseBps;
}

contract Fee {
    /// @dev fee recipient address
    address internal FEE_RECIPIENT;

    /// @dev fee bps
    mapping(uint256 => mapping(uint256 => uint256)) internal FEE_BPS;

    /// @dev fee base
    uint256 internal FEE_BASE_BPS;

    constructor(FeeParameters memory params) {
        FEE_RECIPIENT = params.feeRecipient;
        FEE_BASE_BPS = params.feeBaseBps;
    }
}
