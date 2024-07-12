// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function transferEther(address payable recipient, uint amount) public payable{
        require(msg.sender == owner, "Only the owner can transfer ether");
        require(owner.balance > amount, "Insufficient balance to cover transfer and gas");
        recipient.transfer(amount);
    }

    function getSenderAddress() public view returns (address) {
        return msg.sender;
    }

    function getSenderBalance() public view returns (uint) {
        return owner.balance;
    }
}