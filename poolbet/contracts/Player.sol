pragma solidity ^0.7.0;

contract Player {
    // in one league

    int public balance;
    mapping (matchId => Match) openMatches; 
    int public remaining;

    int public score;    Basket joinedBasket;

    constructior(int startingBetse) {
        // do as little in here as possible
        // remaining = startingBetse;

    }
    function placeBet(matchId mid) public {
        

    }
    function cancelBet(matchId mid) public returns(bool) {

    }
    //if the bet exists and is within the cancel time (cancel up to day before)
        

    // 


}