pragma solidity ^0.4.24;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";


contract GellifiQueToken is StandardToken {
    string public name = "GellifiQue Coin v2";
    string public symbol = "GEL";
    uint public decimals = 18;
    uint public INITIAL_SUPPLY = 100 * (10 ** decimals);

    constructor() public {
        totalSupply_ = INITIAL_SUPPLY;
        balances[msg.sender] = INITIAL_SUPPLY;
    }
}