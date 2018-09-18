pragma solidity ^0.4.24;

import "./GellifiQueToken.sol";
import "zeppelin-solidity/contracts/token/ERC20/StandardToken.sol";

import "zeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "zeppelin-solidity/contracts/crowdsale/distribution/RefundableCrowdsale.sol";

contract GellifiQueSale is CappedCrowdsale {

    // ICO Stage
    // ============
    enum CrowdsaleStage { PreICO, ICO }
    CrowdsaleStage public stage = CrowdsaleStage.PreICO; // By default it's Pre Sale
    // =============

    // Token Distribution
    // =============================
    uint256 public maxTokens = 1000 * (10**18); // There will be total 100 Hashnode Tokens
    uint256 public tokensForEcosystem = 20 * 1000000000000000000;
    uint256 public tokensForTeam = 10000000000000000000;
    uint256 public tokensForBounty = 10000000000000000000;
    uint256 public totalTokensForSale = 60000000000000000000; // 60 HTs will be sold in Crowdsale
    uint256 public totalTokensForSaleDuringPreICO = 20000000000000000000; // 20 out of 60 HTs will be sold during PreICO
    // ==============================

    // Amount raised in PreICO
    // ==================
    uint256 public totalWeiRaisedDuringPreICO;
    // ===================

    // Events
    event EthTransferred(string text);
    event EthRefunded(string text);


    // Constructor
    // ============
    constructor(uint256 _rate, address _wallet, uint256 _cap) 
            CappedCrowdsale(_cap) 
            Crowdsale(_rate, _wallet,  new GellifiQueToken()) public {
        //require(_goal <= _cap);
    }
    // =============

    // Token Deployment
    // =================
    /*
    function createTokenContract() internal returns (StandardToken) {
        return new GellifiQueToken(); // Deploys the ERC20 token. Automatically called when crowdsale contract is deployed
    }
    */
    // ==================

    // Crowdsale Stage Management
    // =========================================================


    // Change the current rate
    function setCurrentRate(uint256 _rate) private {
        rate = _rate;
    }

    // ================ Stage Management Over =====================

    // Token Purchase
    // =========================
    function () external payable {
        uint256 tokensThatWillBeMintedAfterPurchase = msg.value.mul(rate);
        if ((stage == CrowdsaleStage.PreICO) && (token.totalSupply() + tokensThatWillBeMintedAfterPurchase > totalTokensForSaleDuringPreICO)) {
            msg.sender.transfer(msg.value); // Refund them
            emit EthRefunded("PreICO Limit Hit");
            return;
        }

        buyTokens(msg.sender);

        if (stage == CrowdsaleStage.PreICO) {
            totalWeiRaisedDuringPreICO = totalWeiRaisedDuringPreICO.add(msg.value);
        }
    }

    function _forwardFunds() internal {
        if (stage == CrowdsaleStage.PreICO) {
            wallet.transfer(msg.value);
            emit EthTransferred("forwarding funds to wallet");
        } else if (stage == CrowdsaleStage.ICO) {
            emit EthTransferred("forwarding funds to refundable vault");
            super._forwardFunds();
        }
    }
    // ===========================

    // Finish: Mint Extra Tokens as needed before finalizing the Crowdsale.
    // ====================================================================

    // ===============================

    // REMOVE THIS FUNCTION ONCE YOU ARE READY FOR PRODUCTION
    // USEFUL FOR TESTING `finish()` FUNCTION
    /*
    function hasEnded() public view returns (bool) {
        return true;
    }
    */
}