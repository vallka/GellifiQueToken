/*
var GellifiQueToken = artifacts.require("./GellifiQueToken.sol");

module.exports = function(deployer) {
  deployer.deploy(GellifiQueToken);
};
*/

var GellifiQueSale = artifacts.require("./GellifiQueSale.sol");

module.exports = function(deployer) {
  deployer.deploy(GellifiQueSale, 
    5, 
    "0x65C52D32875a9aa6a5Afe11C17E14ebCDcfF65Dd", // Replace this wallet address with the last one (10th account) from Ganache UI. This will be treated as the beneficiary address. 
    5*1000000000000000000 // 5 ETH
  );
};
