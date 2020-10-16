pragma solidity ^0.8.0

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Bettor {
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

    mapping (address => Bettor) public bettors;

    Match[] public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch() {
        require msg.sender == owner;

    }

    function placeBet() {

    }

    function decideMatch
}