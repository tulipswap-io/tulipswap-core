// SPDX-License-Identifier: GPL-3.0

pragma solidity =0.6.12;

import '../TulipERC20.sol';

contract ERC20 is TulipERC20 {
    constructor(uint _totalSupply) public {
        _mint(msg.sender, _totalSupply);
    }
}
