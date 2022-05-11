const BankCorrect = artifacts.require("BankCorrect");

module.exports = function (deployer) {
  deployer.deploy(BankCorrect);
};
