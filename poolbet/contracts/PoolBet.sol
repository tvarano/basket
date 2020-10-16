pragma solidity ^0.7.3

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Bettor {
        string Name;
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

    function genMatchHash(Match m) {
        return string(abi.encodePacked(m.team1, m.team2))
    }

    // all betters in the game
    mapping (address => Bettor) public bettors;
    address[] addresses;
    // all of the matches for the week
    mapping (string => Match) public matches;

    constructor () {
        owner = msg.sender;
    }

    function addMatch(string json) {
        require(msg.sender == owner, "Only owners can add matches.")

        parseMatch(json)
    }

    function placeBet(address bettor, string matchid, string team) {
        bettor = bettors[bettor]

        current_match = matches[matchid]

        if (compareStrings(team, current_match.team1)) {
            current_match.bettor1.push(bettor)
        } else if (compareStrings(team, current_match.team2)) {
            current_match.bettor2.push(bettor)
        } else {
            revert("Invalid team.")
        }
    }

    function decideMatch(string  matchid, string winner) {
        require(msg.sender == owner, "Only owner can decide matches.")

        if (compareStrings(winner, matches[matchid].team1)) {
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
        uint address_length = addresses.length;
        address max_address;
        uint max = 0;

        for (uint i=0; i<address_length; i++) {
            if (bettors[addresses[i]].max > max) {
                max_address = addresses[i];
                max = bettors[addresses[i]].score;
            }
        }

        return max_address;
    }

    function compareStrings(string memory a, string memory b) public view returns (bool) {
        return (keccak256(abi.encodePacked((a))) == keccak256(abi.encodePacked((b))));
    }
}

