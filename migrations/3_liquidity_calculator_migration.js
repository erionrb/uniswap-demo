const LiquidityValueCalculator = artifacts.require("LiquidityValueCalculator");

module.exports = function (deployer) {
  const UNISWAP_V2_ROUTER = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
  deployer.deploy(LiquidityValueCalculator, "");
};
