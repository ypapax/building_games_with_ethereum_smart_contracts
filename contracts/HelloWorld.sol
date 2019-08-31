pragma solidity ^0.5.8;

contract HelloWorld {
    address payable owner;
    string greeting = "Hello World";
    // Constructor function
    constructor() public {
        owner = msg.sender;
    }

    function greet() view public returns (string memory x) {
        return greeting;
    }

    function kill() public {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
}