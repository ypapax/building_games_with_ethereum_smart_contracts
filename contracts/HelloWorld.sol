pragma solidity ^0.4.15;

contract HelloWorld {
    address owner;
    string greeting = "Hello World";
    // Constructor function
    function HelloWorld() public {
        owner = msg.sender;
    }

    function greet() constant public returns (string) {
        return greeting;
    }

    function kill() public {
        require(owner == msg.sender);
        selfdestruct(owner);
    }
}