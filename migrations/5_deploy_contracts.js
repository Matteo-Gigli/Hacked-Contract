const AttackCorrect = artifacts.require("AttackCorrect");
const BankCorrect = artifacts.require("Bank");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(AttackCorrect, BankCorrect.address, {from: accounts[9]});
};

