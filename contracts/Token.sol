//SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public minter;
    
    constructor(
        string memory name,
        string memory symbol,
        uint256 amount
    ) public payable ERC20("ImpWong Currency", "IWC") {
        _mint(msg.sender, amount);
    }
}
