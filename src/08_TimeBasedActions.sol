// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title TimeBasedActions
 * @dev Implement time-based logic in functions
 */
contract TimeBasedActions {
  uint256 public actionAvailableAfter;
  bool public actionTaken = false;

  /**
   * @dev Constructor sets when the action can first be taken
   * @param delayInSeconds The delay in seconds after which the action can be taken
   */
  constructor(uint256 delayInSeconds) {
    actionAvailableAfter = block.timestamp + delayInSeconds;
  }

  /**
   * @dev Perform an action only if the current time is after actionAvailableAfter
   */
  function performAction() public {
    // TODO: Implement the performAction function
    // It should only allow the action to be taken if the current time is after actionAvailableAfter
    // Once the action is taken, set actionTaken to true
    require(block.timestamp <= actionAvailableAfter, "Action should be taken after time delay");

    actionTaken = true;
  }
}
