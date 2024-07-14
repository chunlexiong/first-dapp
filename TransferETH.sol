// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract EtherTransfer {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    receive() external payable {}

    function transferEther(address payable recipient, uint amount) public payable{
        uint totalGas = 0.003 ether;
        require(msg.sender == owner, "Only the owner can transfer ether");
        uint totalAmount = totalGas + amount;
        require(owner.balance >= totalAmount, "Insufficient balance to cover transfer and gas");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Attention: transfer failed.");
    }

    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }
}