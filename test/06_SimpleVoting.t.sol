// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/06_SimpleVoting.sol";

contract SimpleVotingTest is Test {
  SimpleVoting simpleVoting;
  string[] options = ["Option1", "Option2", "Option3"];

  function setUp() public {
    simpleVoting = new SimpleVoting(options);
  }

  function testMultipleVoters() public {
    // Voter 1 votes for Option1
    vm.prank(address(0x123));
    simpleVoting.vote("Option1");

    // Voter 2 votes for Option2
    vm.prank(address(0x456));
    simpleVoting.vote("Option2");

    // Voter 1 votes again for Option1
    vm.prank(address(0x123));
    simpleVoting.vote("Option1");

    // Voter 3 votes for Option2
    vm.prank(address(0x789));
    simpleVoting.vote("Option2");

    assertEq(simpleVoting.totalVotesFor("Option1"), 2, "Option1 should have 2 votes");
    assertEq(simpleVoting.totalVotesFor("Option2"), 2, "Option2 should have 2 votes");
    assertEq(simpleVoting.totalVotesFor("Option3"), 0, "Option3 should have 0 votes");
  }
}
