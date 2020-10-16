pragma solidity ^0.5.0

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Better {
        uint score;
        uint remaining_bets; 
    }

    struct Match {
        string team1;
        uint odd1;
        string team2;
        uint odd2;
        address[] bettor1;
        address[] bettor2;
    }

    function genMatchHash(Match => m) {
        return string(abi.encodePacked(m.team1, m.team2))
    }

    // all betters in the game
    mapping (address => Better) public bettors;
    // all of the matches for the week
    mapping (string => Match) public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch(address) {
        
    }

    function placeBet() {

    }

    function decideMatch(string  matchid, string winner) {
        if (winner == matches[matchid].team1) {
            address[] win_arr = matches[matchid].bettor1;
        } else {
            address[]  win_arr = matches[matchid].bettor2;
        }

        uint arrayLength = win_arr.length;
        for (uint i=0; i<arrayLength; i++) {
            bettors[win_arr[i]].score ++;
        }
    }



    function resetWeek() {
        // clear the hash

        // reset better remaining bets
    }

    function findWinner() {
        // iterate through users, find one with the most 
    }
}