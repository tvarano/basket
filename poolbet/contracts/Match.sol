pragma solidity ^0.7.0;
import "./BasketPlayer.sol";
import "./Basket.sol";

contract Match {
    struct Bet { 
        string team; 
        int oddsPlaced;
        basketID basket;
    }

    mapping (address => Bet) public bets;
    
    string team1;
    string team2;

    int team1odds;
    int team2odds;
}