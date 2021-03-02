//SPDX-License-Identifier: Unlicense
pragma solidity ^0.6.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
    address public minter;

    //add minter changed event
    event MinterChanged(address indexed from, address to);
    
   constructor(
        string memory name,
        string memory symbol,
        uint256 amount
    ) public ERC20(name, symbol) {
        _mint(msg.sender, amount);
    }

    function passMinterRole(address dBank) public returns (bool) {
        require(msg.sender==minter, 'Error, only owner can change pass minter role');
        minter = dBank;

        emit MinterChanged(msg.sender, dBank);
        return true;
    }

    function mint(address account, uint256 amount) public {
        //check if msg.sender have minter role
        require(msg.sender == minter, 'Error, msg.sender does not have minter role'); 
        _mint(account, amount);
    }
}
