// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/11_SimpleDAO.sol";

contract SimpleDAOTest is Test {
  SimpleDAO simpleDAO;
  address[] initialMembers;

  function setUp() public {
    initialMembers = new address[](2);
    initialMembers[0] = address(0x123);
    initialMembers[1] = address(0x456);
    simpleDAO = new SimpleDAO(initialMembers);
  }

  function testCreateProposal() public {
    vm.prank(initialMembers[0]);
    simpleDAO.createProposal("Proposal 1");

    // Verify proposal creation
    (string memory description,) = simpleDAO.proposals(0);
    assertEq(description, "Proposal 1", "Proposal description should match");
  }

  function testVoteOnProposal() public {
    // Create a proposal to vote on
    vm.prank(initialMembers[0]);
    simpleDAO.createProposal("Proposal 1");

    // Member 1 votes on the proposal
    vm.prank(initialMembers[0]);
    simpleDAO.voteOnProposal(0);

    // Verify the vote
    (, uint256 voteCount) = simpleDAO.proposals(0);
    assertEq(voteCount, 1, "Vote count should be 1");
  }

  // Additional tests needed for executing proposals and edge cases
}
