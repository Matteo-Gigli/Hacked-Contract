const Attack = artifacts.require("Attack");
const Bank = artifacts.require("Bank");

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Attack, Bank.address, {from: accounts[9]});
};
