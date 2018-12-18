pragma solidity ^0.4.24;
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Detailed.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20Mintable.sol";
import "openzeppelin-solidity/contracts/ownership/Ownable.sol";


contract GellifiQueToken is ERC20,ERC20Detailed,ERC20Mintable,Ownable {
    string name_ = "GellifiQue Coin v2";
    string symbol_ = "GEL";
    uint8 decimals_ = 18;
    //uint public INITIAL_SUPPLY = 100 * (10 ** decimals);

    constructor() 
    ERC20Detailed(name_, symbol_, decimals_)
    public {
        //totalSupply(INITIAL_SUPPLY);
        //balances[msg.sender] = INITIAL_SUPPLY;
    }
}