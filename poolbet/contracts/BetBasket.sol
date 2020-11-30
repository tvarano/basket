pragma solidity ^0.7.0;
import "./Player.sol";
import "./Match.sol";
import "./Basket.sol";

contract BetBasket {
    // baskets and matches are hashed with uints

    // mapping of all the matches
    mapping(address => mapping(uint => Match)) matches;

    // receive info from server
    function rake() {

    }

    // all users and their involvements
    mapping(address => mapping(uint => Player)) players;


    function placeBet(address addr, uint basketId, uint matchId) returns(bool) {
        matches[matchId].addBet();
    }

    function revokeBet(address addr, uint basketId, uint matchId) returns(bool) {
        // make sure you have time to revoke
    }

    function addPlayer(address addrm, uint basketId) returns(bool) {

    }
}