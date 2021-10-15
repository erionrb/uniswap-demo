const assert = require("chai").assert;
const truffleAssert = require('truffle-assertions');
const BN = web3.utils.BN;

const TokenA            = artifacts.require("TokenA");
const TokenB            = artifacts.require("TokenB");
const LiquidityManager  = artifacts.require("LiquidityManager");
const UNISWAP_V2_ROUTER = "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D";

const toWei = async (number) => {
    return await web3.utils.toWei(number, "ether");
};  

contract("LiquidityManager", async (accounts) => {

    let tokenA;
    let tokenB;
    let liquidityManager;
    let tokenAAmount = await toWei("1000000");
    let tokenBAmount = await toWei("1000000");
    const LP_RECEIVER = accounts[1];
    const TEN_MINUTES_DEADLINE = Math.floor(Date.now() / 1000) + 60 * 10;

    describe("Liquidity Workflow", async () => {

        beforeEach("Setup for each test", async () => {

            tokenA = await TokenA.new();
            tokenB = await TokenB.new();
            liquidityManager = await LiquidityManager.new(UNISWAP_V2_ROUTER);

            tokenA.transfer(LP_RECEIVER, tokenAAmount);
            tokenB.transfer(LP_RECEIVER, tokenBAmount);
        });

        it("Should add liquidity", async () => {

            let tokenABalanceBefore = (await tokenA.balanceOf(LP_RECEIVER)).toString();
            let tokenBBalanceBefore = (await tokenB.balanceOf(LP_RECEIVER)).toString();

            await tokenA.approve(liquidityManager.address, tokenAAmount);
            await tokenB.approve(liquidityManager.address, tokenBAmount);

            await liquidityManager.addLiquidity(
                // address _tokenA,
                tokenA.address,
                // address _tokenB,
                tokenB.address,
                // uint _amountADesired,
                tokenAAmount,
                // uint _amountBDesired,
                tokenBAmount,
                // uint _amountAMin,
                tokenAAmount,
                // uint _amountBMin,
                tokenBAmount,
                // address _to,
                LP_RECEIVER,
                // uint _deadline
                TEN_MINUTES_DEADLINE
            );

            // TODO put verifications here
        });
    });

});