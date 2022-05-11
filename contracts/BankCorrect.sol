//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

pragma solidity ^0.8.4;


contract BankCorrect is Ownable, ReentrancyGuard{

    mapping(address=>uint)private _balances;

    constructor(){

    }

    function deposit()external payable nonReentrant{
        require(msg.value > 0, "Cannot deposit 0 ether!");
        _balances[msg.sender] += msg.value;
    }


    function withdraw()external nonReentrant{
        require(_balances[msg.sender] > 0, "Your funds are 0!");
        payable(msg.sender).transfer(_balances[msg.sender]);
        _balances[msg.sender] = 0;
    }


    function getContractBalance()public view returns(uint){
        return address(this).balance;
    }


}
