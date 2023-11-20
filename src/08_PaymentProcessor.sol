// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title PaymentProcessor
 * @dev Contract to receive and withdraw Ether
 */
contract PaymentProcessor {
  address payable public owner;

  // TODO: Declare an event for recording payments received

  // TODO: Declare an event for logging withdrawals

  constructor() {
    owner = payable(msg.sender);
  }

  /**
   * @dev Function to receive Ether. msg.data must be empty
   */
  receive() external payable {
    // TODO: Implement functionality to record the payment
    // Emit the payment received event
  }

  /**
   * @dev Withdraw the contract's entire Ether balance to the owner
   */
  function withdraw() public {
    require(msg.sender == owner, "Only owner can withdraw");

    // TODO: Implement the withdrawal logic
    // Emit the withdrawal event
  }

  /**
   * @dev Get the contract's current Ether balance
   * @return The contract's current Ether balance
   */
  function getBalance() public view returns (uint256) {
    return address(this).balance;
  }
}
