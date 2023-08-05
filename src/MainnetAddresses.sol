// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.15;

abstract contract MainnetAddresses {
    address public constant WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant DAI = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant USDC = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

    ////////////////////////////////////////////////////////////////////
    //                           Uniswap V2                           //
    ////////////////////////////////////////////////////////////////////

    address public constant UNI_V2_FACTORY = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    address public constant UNI_V2_ETH_DAI_PAIR = 0xA478c2975Ab1Ea89e8196811F51A7B7Ade33eB11;
}
