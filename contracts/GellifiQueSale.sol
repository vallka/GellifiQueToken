pragma solidity ^0.4.24;

import "./GellifiQueToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract GellifiQueSale is Crowdsale,MintedCrowdsale {
    // Constructor
    constructor(uint256 rate, address wallet, ERC20 token) 
        Crowdsale(rate, wallet, token)
        MintedCrowdsale()
        public
    {
    }
}
