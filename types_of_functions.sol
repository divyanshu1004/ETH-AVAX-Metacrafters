// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BaseContract {
    uint public storedData;

    // Constructor to initialize storedData
    constructor(uint initialValue) {
        storedData = initialValue;
    }

    // View function to get the stored data
    function getStoredData() public view returns (uint) {
        return storedData;
    }

    // Pure function to add two numbers
    function add(uint a, uint b) public pure returns (uint) {
        return a + b;
    }

    // Payable function to receive Ether and update storedData
    function receiveEther() public payable {
        require(msg.value > 0, "Must send some Ether");
        storedData += msg.value;
    }

    // Function to get the balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

contract DerivedContract extends BaseContract {
    // Constructor to initialize storedData in the base contract
    constructor(uint initialValue) BaseContract(initialValue) {}

    // Function to multiply storedData by a given factor
    function multiplyStoredData(uint factor) public view returns (uint) {
        return storedData * factor;
    }

    // Function to subtract a value from storedData
    function subtractFromStoredData(uint value) public view returns (uint) {
        require(value <= storedData, "Subtraction would result in a negative number");
        return storedData - value;
    }
}
