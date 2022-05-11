const Bank = artifacts.require("Bank");

contract("Should be able to use the Bank Contract", function(accounts){


    it("Should be able to deposit an amount", async()=>{
        let instance = await Bank.deployed();
        await instance.deposit({value:10000000000000000000});
        let balanceContract = await instance.getContractBalance();
        assert.equal(balanceContract, 10000000000000000000);
    })

    it("Should be able to withdraw all your balance", async()=>{
        let instance = await Bank.deployed();
        await instance.deposit({value:10000000000000000000});
        let contractBalance = await instance.getContractBalance();
        assert.equal(contractBalance, 20000000000000000000);
        await instance.withdraw();
        let contractBalanceAfterWithdraw = await instance.getContractBalance();
        assert.equal(contractBalanceAfterWithdraw, 0);
    })

    }
)