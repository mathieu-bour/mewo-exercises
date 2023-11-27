// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/07_AdvancedVoting.sol";

contract AdvancedVotingTest is Test {
  AdvancedVoting voting;
  string[] options = ["Option1", "Option2", "Option3"];

  address user1 = address(0x123);
  address user2 = address(0x456);
  address user3 = address(0x789);

  function setUp() public {
    voting = new AdvancedVoting(options);
  }

  function testVoteNormal() public {
    uint256 before1 = voting.totalVotesFor("Option1");
    uint256 before2 = voting.totalVotesFor("Option2");
    uint256 before3 = voting.totalVotesFor("Option3");

    vm.prank(user1);
    voting.vote("Option1");

    assertEq(voting.totalVotesFor("Option1"), before1 + 1);
    assertEq(voting.totalVotesFor("Option2"), before2);
    assertEq(voting.totalVotesFor("Option3"), before3);
  }

  function testVoteNonExisting() public {
    vm.prank(user1);
    vm.expectRevert();
    voting.vote("Option4"); // Option4 does not exist

    assertEq(voting.totalVotesFor("Option4"), 0);
  }

  function testAlreadyVoted() public {
    // first vote: pass
    vm.prank(user1);
    voting.vote("Option1");

    vm.prank(user1);
    vm.expectRevert();
    voting.vote("Option1");
  }
}
