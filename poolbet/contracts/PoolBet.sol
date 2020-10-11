pragma solidity ^0.5.0

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Better {
        uint score;
        uint remaining_bets;
    }

    struct Match {
        bytes32 game;
        bytes32 team1;
        uint odd1;
        bytes32 team2;
        uint odd2;
    }

    mapping (address => Better) public betters;

    Match[] public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch() {
        
    }

    function placeBet() {

    }

    function decideMatch
}