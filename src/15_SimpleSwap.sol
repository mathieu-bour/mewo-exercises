// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleSwap {
  address public admin;
  uint256 public rate; // Number of tokens given for 1 Ether

  constructor(uint256 _initialRate) {
    admin = msg.sender;
    rate = _initialRate;
  }

  // TODO: Create a function `swap` to exchange Ether for tokens at the current rate

  // TODO: Create an admin-only function `setRate` to modify the exchange rate

  // Helper function to check the contract's Ether balance
  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }

  // Function to receive Ether. Required since Solidity 0.6
  receive() external payable { }
}
