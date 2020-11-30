pragma solidity ^0.7.0;
import "./Player.sol";
import "./Match.sol";
import "./Basket.sol";

contract BetBasket {
    // baskets and matches are hashed with uints

    // mapping of all the matches
    mapping(address => mapping(uint => Match));

    // receive info from server
    function rake() {

    }

    // all users and their involvements
    mapping(address => mapping(uint => Player));


    function placeBet(address addr, uint basketId, uint matchId) {
        
    }
}