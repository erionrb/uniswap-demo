// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import './interfaces/UniswapV2Router02.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract LiquidityManager is Ownable {

    address payable public uniswapV2Router02Address;

    constructor(address payable _uniswapV2Router02Address) public {
        uniswapV2Router02Address = _uniswapV2Router02Address;
    }

    /**
     * @notice Add liquidity for tokens in Uniswap.
     *
     * @param _tokenA	        A pool token
     * @param _tokenB	        A pool token
     * @param _amountADesired   The amount of tokenA to add as liquidity if the B/A price is <= amountBDesired/amountADesired (A depreciates)
     * @param _amountBDesired   The amount of tokenB to add as liquidity if the A/B price is <= amountADesired/amountBDesired (B depreciates)
     * @param _amountAMin	    Bounds the extent to which the B/A price can go up before the transaction reverts Must be <= amountADesired
     * @param _amountBMin	    Bounds the extent to which the A/B price can go up before the transaction reverts Must be <= amountBDesired
     * @param _to	            Recipient of the liquidity tokens
     * @param _deadline	        Unix timestamp after which the transaction will revert
     *
     * @return amountA	        The amount of tokenA sent to the pool
     * @return amountB	        The amount of tokenB sent to the pool
     * @return liquidity	    The amount of liquidity tokens minted
     */
    function addLiquidity(
        address _tokenA,  
        address _tokenB,  
        uint _amountADesired,  
        uint _amountBDesired,  
        uint _amountAMin,  
        uint _amountBMin,  
        address _to,  
        uint _deadline
    ) external onlyOwner returns (
        uint amountA, 
        uint amountB, 
        uint liquidity
    ) {
        (amountA, amountB, liquidity) = UniswapV2Router02(uniswapV2Router02Address).addLiquidity(
            _tokenA,
            _tokenB, 
            _amountADesired,
            _amountBDesired,
            _amountAMin,
            _amountBMin, 
            _to,
            _deadline
        );
    }
}
