// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/07_TimeBasedActions.sol";

contract TimeBasedActionsTest is Test {
  TimeBasedActions timeBasedActions;
  uint256 delay = 5 minutes;

  function setUp() public {
    timeBasedActions = new TimeBasedActions(delay);
  }

  function testPerformActionBeforeTime() public {
    vm.expectRevert("Action not available yet");
    timeBasedActions.performAction();
  }

  function testPerformActionAfterTime() public {
    // Fast forward time
    vm.warp(block.timestamp + delay);
    timeBasedActions.performAction();
    assertTrue(timeBasedActions.actionTaken(), "Action should be taken after time delay");
  }
}
