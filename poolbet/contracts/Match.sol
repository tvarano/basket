//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.7.4;

contract Match {
    struct Bet { 
        string team; 
        int oddsPlaced;
        int wager;
        bool exists;
    }
    
    address owner;

    mapping (address => Bet) public bets;
    
    string team1;
    string team2;

    int team1odds;
    int team2odds;
    
    constructor(string memory _team1, string memory _team2) {
        owner = msg.sender;
        
        team1 = _team1;
        team2 = _team2;
    }

    // We need to make this external, then accessible from the master contract rather than the setup of having an owner access it.
    function setOdds(int _team1odds, int _team2odds) public {
        require(msg.sender == owner, "Only the owner of the contract can edit odds.");
        
        team1odds = _team1odds;
        team2odds = _team2odds;
    }
    
    function getTeam(int team) public view returns (string memory) {
        if (team == 1) {
            return team1;
        } else if (team == 2) {
            return team2;
        } else {
            return "Invalid argument";
        }
    }
    
    function getOdds(int team) public view returns (int) {
        if (team == 1) {
            return team1odds;
        } else if (team == 2) {
            return team2odds;
        } else {
            return 0;
        }
    }
    
    function placeBet(int team, int wager) public {
        Bet memory b;
        b.wager = wager;
        b.exists = true;
        if (team == 1) {
            b.oddsPlaced = team1odds;
            b.team = team1;
        } else if (team == 2) {
            b.oddsPlaced = team2odds;
            b.team = team2;
        } else {
            revert("Invalid team ID.");
        }
        
        bets[msg.sender] = b;
    }
    
    function getBet(address _address) public view returns (string memory, int) {
        require(bets[_address].exists == true, "This address has no bet.");
        
        return (bets[_address].team, bets[_address].wager);
    }
}