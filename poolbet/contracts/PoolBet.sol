pragma solidity ^0.5.0

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Better {
        uint score;
        uint remaining_bets; 
    }

    struct Match {
        bytes32 team1;
        uint odd1;
        bytes32 team2;
        uint odd2;
    }

    function genMatchHash(Match => m) {
        return string(abi.encodePacked(m.team1, m.team2))
    }

    // all betters in the game
    mapping (address => Better) public betters;
    // all of the matches for the week
    mapping (string => Match) public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch(address) {
        
    }

    function placeBet() {

    }

    function decideMatch



    function resetWeek() {
        // clear the hash

        // reset better remaining bets
    }

    function findWinner() {
        // iterate through users, find one with the most 
    }
}