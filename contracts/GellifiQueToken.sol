pragma solidity ^0.4.24;
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

contract GellifiQueToken is StandardToken {
  string public name = "GellifiQue Coin";
  string public symbol = "GEL";
  uint public decimals = 18;
  uint public INITIAL_SUPPLY = 1000000 * (10 ** decimals);

  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }
}