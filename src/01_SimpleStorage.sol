// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title SimpleStorage
 * @dev Store & retrieve value in a variable
 */
contract SimpleStorage {
  uint256 private _storedValue;

  /**
   * @dev Store value in variable
   * @param value value to store
   */
  function store(uint256 value) public {
    // TODO: Implement the store function to update the _storedValue variable
    _storedValue = value;
  }

  /**
   * @dev Return value
   * @return value of 'storedValue'
   */
  function retrieve() public view returns (uint256) {
    // TODO: Implement the retrieve function to return the _storedValue
    return _storedValue;
  }
}
