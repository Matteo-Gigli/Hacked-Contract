//SPDX-License-Identifier: MIT

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Address.sol";

pragma solidity ^0.8.4;

contract Bank is Ownable{
    using Address for address payable;

    mapping(address=>uint)private _balances;

    constructor(){

    }

    function deposit()external payable{
        _balances[msg.sender] += msg.value;
    }


    function withdraw()external{
        require(_balances[msg.sender] > 0, "You have 0 funds depositated!");
        payable(msg.sender).sendValue(_balances[msg.sender]);
        _balances[msg.sender] = 0;
    }

    function getContractBalance()public view returns(uint){
        return address(this).balance;
    }
}
