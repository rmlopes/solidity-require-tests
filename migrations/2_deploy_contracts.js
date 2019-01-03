var TheContract = artifacts.require("./TheContract.sol");

module.exports = function(deployer) {
  deployer.deploy(TheContract);
};
