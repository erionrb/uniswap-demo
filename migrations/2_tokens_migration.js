require('dotenv').config();

const SKIP_ALL = process.env.SKIP_ALL;
const TokenA = artifacts.require("TokenA");
const TokenB = artifacts.require("TokenB");

module.exports = function (deployer) {
  if(SKIP_ALL) return;
  
  deployer.deploy(TokenA);
  deployer.deploy(TokenB);
};
