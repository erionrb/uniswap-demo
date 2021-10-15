// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

import './interfaces/UniswapV2Router02.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract LiquidityManager {

    address payable public ROUTER_V2;

    constructor(address payable _ROUTER_V2) public {
        ROUTER_V2 = _ROUTER_V2;
    }

    event AddedLiquidity(uint256 amountA, uint256 amountB, uint256 liquidity);

    function deposit(address _token, uint256 _amount) public {
        require(
            IERC20(_token).balanceOf(msg.sender) >= _amount,
            "Sender dos not have sufficient balance"
        );
        IERC20(_token).transferFrom(msg.sender, address(this), _amount);
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
    ) external {
        require(
            IERC20(_tokenA).balanceOf(msg.sender) >= _amountADesired,
            "Sender dos not have sufficient balance"
        );
        require(
            IERC20(_tokenB).balanceOf(msg.sender) >= _amountBDesired,
            "Sender dos not have sufficient balance"
        );

        IERC20(_tokenA).transferFrom(msg.sender, address(this), _amountADesired);
        IERC20(_tokenB).transferFrom(msg.sender, address(this), _amountBDesired);
        
        IERC20(_tokenB).approve(ROUTER_V2, _amountBDesired);
        IERC20(_tokenA).approve(ROUTER_V2, _amountADesired);

        (uint256 amountA, uint256 amountB, uint256 liquidity) = UniswapV2Router02(ROUTER_V2).addLiquidity(
            _tokenA,
            _tokenB, 
            _amountADesired,
            _amountBDesired,
            _amountAMin,
            _amountBMin, 
            _to,
            _deadline
        );

        emit AddedLiquidity(amountA, amountB, liquidity);
    }

    receive() external payable {}
}
