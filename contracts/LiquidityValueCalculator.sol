// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import './interfaces/ILiquidityValueCalculator.sol';
import '@uniswap/v2-periphery/contracts/libraries/UniswapV2Library.sol';
import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';

contract LiquidityValueCalculator is ILiquidityValueCalculator {
    address public factory;
    constructor(address _factory) public {
        factory = _factory;
    }

    function pairInfo(
        address _tokenA, 
        address _tokenB
    ) internal view returns (
        uint reserveA,
        uint reserveB,
        uint totalSupply
    ) {
        IUniswapV2Pair pair = IUniswapV2Pair(
            UniswapV2Library.pairFor(factory, _tokenA, _tokenB)
        );
        totalSupply = pair.totalSupply();
        (uint reserves0, uint reserves1, ) = pair.getReserves();
        (reserveA, reserveB) = _tokenA == pair.token0() ? (reserves0, reserves1) : (reserves1, reserves0);
    }

    function computeLiquidityShareValue(
        uint _liquidity, 
        address _tokenA, 
        address _tokenB
    ) external override returns (
        uint tokenAAmount, 
        uint tokenBAmount
    ) {
        revert('TODO');
    }
}