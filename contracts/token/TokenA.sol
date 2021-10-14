// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

contract TokenA is ERC20 {

    constructor() ERC20("Token A", "TKA") public {
        _mint(msg.sender, 20000000*10**18);
    }

}