// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title SimpleLottery
 * @dev Basic lottery contract for demonstration
 */
contract SimpleLottery {
  address payable[] public participants;
  address public winner;
  uint256 public ticketPrice;
  uint256 public maxParticipants;

  // TODO: Declare an event for a new participant
  // TODO: Declare an event for declaring the winner

  constructor(uint256 _ticketPrice, uint256 _maxParticipants) {
    ticketPrice = _ticketPrice;
    maxParticipants = _maxParticipants;
  }

  /**
   * @dev Enter the lottery by sending the ticket price
   */
  function enterLottery() public payable {
    // TODO: Implement the enterLottery function
    // Require the sent amount to be equal to the ticket price
    // Add the sender to the participants array
    // Emit the new participant event
    // If maxParticipants is reached, select a winner
  }

  /**
   * @dev Select a winner randomly from the participants
   */
  function selectWinner() private {
    // TODO: Implement the selectWinner function
    // Randomly select a winner from the participants
    // Transfer the contract's balance to the winner
    // Emit the winner declared event
  }

  /**
   * @dev Get the number of participants
   * @return The number of participants
   */
  function getNumberOfParticipants() public view returns (uint256) {
    return participants.length;
  }
}
