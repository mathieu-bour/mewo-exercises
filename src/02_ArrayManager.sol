// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title ArrayManager
 * @dev Manage an array of unsigned integers
 */
contract ArrayManager {
  uint256[] private values;

  /**
   * @dev Add a value to the array
   * @param value The value to be added
   */
  function addValue(uint256 value) public {
    // TODO: Implement the addValue function to add a value to the array
  }

  /**
   * @dev Retrieve the value at a specified index in the array
   * @param index The index of the value to retrieve
   * @return The value at the specified index
   */
  function getValue(uint256 index) public view returns (uint256) {
    // TODO: Implement the getValue function to return a value from the array
  }

  /**
   * @dev Remove the value at a specified index in the array
   * @param index The index of the value to remove
   */
  function removeValue(uint256 index) public {
    // TODO: Implement the removeValue function to remove a value from the array
  }
}
