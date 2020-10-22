pragma solidity ^0.7.3;

contract PoolBet
{
    address public owner; // Creator of smart contract, can decide outcomes/add users etc.

    struct Bettor {
        string name;
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


    // all betters in the game
    mapping (address => Bettor) public bettors;
    address[] addresses;
    // all of the matches for the week
    mapping (string => Match) public matches;

    constructor () {
        owner = msg.sender;
    }

    function addBetter(address  add, string nme) public {
        require (msg.sender == owner, "Only the owner can add pool members.");

        addresses.push(add);
        bettors[add] = Bettor({name: nme, score: 0, remaining_bets: 1});
    }
    
    function genMatchHash(Match memory m)  public {
        return string(abi.encodePacked(m.team1, m.team2));
    }

    function addMatch(string memory json) public {
        require(msg.sender == owner, "Only owners can add matches.");

        // Owner adds match here
    }

    function placeBet(string memory matchid, string memory team) public {
        address bettor = msg.sender;

        Match current_match = matches[matchid];

        if (bettors[bettor] != address(0x0)) {
            if (compareStrings(team, current_match.team1)) {
                current_match.bettor1.push(bettor);
            } else if (compareStrings(team, current_match.team2)) {
                current_match.bettor2.push(bettor);
            } else {
                revert("Invalid team.");
            }
        } else {
            revert("This address is not a bettor.");
        }
    }

    function decideMatch(string matchid, string winner) public {
        require(msg.sender == owner, "Only owner can decide matches.");
        
        address win_arr = [];

        if (compareStrings(winner, matches[matchid].team1)) {
            win_arr = matches[matchid].bettor1;
        } else {
            win_arr = matches[matchid].bettor2;
        }

        for (uint i=0; i<win_arr.length; i++) {
            bettors[win_arr[i]].score ++;
        }
    }

    function resetWeek() public {
        // clear the hash

        // reset better remaining bets
    }

    function findWinner() public {
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

