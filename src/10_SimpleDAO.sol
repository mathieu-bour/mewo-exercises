// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title SimpleDAO
 * @dev Basic DAO contract for demonstration
 */
contract SimpleDAO {
  struct Proposal {
    string description;
    uint256 voteCount;
  }

  Proposal[] public proposals;
  mapping(address => bool) public members;
  mapping(address => mapping(uint256 => bool)) public votes;

  // TODO: Declare events for creating proposals, voting, and executing proposals

  modifier onlyMember() {
    require(members[msg.sender], "Not a member");
    _;
  }

  constructor(address[] memory initialMembers) {
    for (uint256 i = 0; i < initialMembers.length; i++) {
      members[initialMembers[i]] = true;
    }
  }

  /**
   * @dev Create a new proposal
   * @param description The description of the proposal
   */
  function createProposal(string memory description) public onlyMember {
    // TODO: Implement the createProposal function
    // Add the new proposal to the proposals array
    // Emit the proposal created event
  }

  /**
   * @dev Vote on a proposal
   * @param proposalIndex The index of the proposal in the array
   */
  function voteOnProposal(uint256 proposalIndex) public onlyMember {
    // TODO: Implement the voteOnProposal function
    // Ensure the member has not already voted on this proposal
    // Increment the vote count for the proposal
    // Record that the member has voted on this proposal
    // Emit the voted event
  }

  /**
   * @dev Execute the proposal with the most votes
   */
  function executeProposal() public {
    // TODO: Implement the executeProposal function
    // Determine the proposal with the most votes
    // Execute the decision of the winning proposal
    // Emit the proposal executed event
  }
}
