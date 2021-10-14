// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 

contract TokenB is ERC20 {

    constructor() ERC20("Token B", "TKB") public {
        _mint(msg.sender, 20000000*10**18);
    }

}