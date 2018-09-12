var GellifiQueToken = artifacts.require("./GellifiQueToken.sol");

module.exports = function(deployer) {
  deployer.deploy(GellifiQueToken);
};
