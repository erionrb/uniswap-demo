const LiquidityManager = artifacts.require("LiquidityManager");

module.exports = function (deployer) {
  const UNISWAP_V2_ROUTER = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";
  deployer.deploy(LiquidityManager, UNISWAP_V2_ROUTER);
};
