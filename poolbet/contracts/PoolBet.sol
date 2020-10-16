pragma solidity ^0.7.3

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Better {
        string Name;
        uint score;
        uint remaining_bets; 
    }

    struct Match {
        string team1;
        uint odd1;
        string team2;
        uint odd2;
    }

    function genMatchHash(Match m) {
        return string(abi.encodePacked(m.team1, m.team2))
    }

    // all betters in the game
    mapping (address => Better) public bettors;
    // all of the matches for the week
    mapping (string => Match) public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch(string json) {
        parseMatch(json)
    }

    function placeBet(address bettor, string matchid, string team) {
    }

    function decideMatches(string json) {
        
    }


    function resetWeek() {
        // clear the hash

        // reset better remaining bets
    }

    function findWinner() {
        // iterate through users, find one with the most 
    }
}