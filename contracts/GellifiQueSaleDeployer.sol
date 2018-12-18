pragma solidity ^0.4.24;

import "./GellifiQueToken.sol";
import "./GellifiQueSale.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";

import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";

contract GellifiQueSaleDeployer {
    GellifiQueToken token;
    Crowdsale crowdsale;

    constructor()
    public
    {
    }

    function go() public returns (address)
    {
        // create a mintable token
        //ERC20Mintable token = new GellifiQueToken();
        token = new GellifiQueToken();

        // create the crowdsale and tell it about the token
        crowdsale = new GellifiQueSale(
            10,               // rate, still in TKNbits
            msg.sender,      // send Ether to the deployer
            token  // the token
        );
        // transfer the minter role from this contract (the default)
        // to the crowdsale, so it can mint tokens
        //token.transferOwnership(address(crowdsale));
        token.transferOwnership(address(msg.sender));
        token.addMinter(address(msg.sender));

        return address(crowdsale);
    }

    function info() public view returns (string) 
    {
        return "this is GellifiQueSaleDeployer.info";
    }

    function getTokenObj() public view returns (GellifiQueToken) 
    {
        return token;
    }

    function getSaleObj() public view returns (Crowdsale) 
    {
        return crowdsale;
    }

}
