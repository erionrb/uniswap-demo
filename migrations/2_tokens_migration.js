const TokenA = artifacts.require("TokenA");
const TokenB = artifacts.require("TokenB");

module.exports = function (deployer) {
  deployer.deploy(TokenA);
  deployer.deploy(TokenB);
};
