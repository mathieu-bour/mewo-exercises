// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title EventLogger
 * @dev Log events for contract actions
 */
contract EventLogger {
  uint256[] private data;

  event DataAdded(uint256 indexed data, address indexed addedBy);
  event DataRemoved(uint256 indexed data, address indexed removedBy);

  /**
   * @dev Add data to the array and emit an event
   * @param _data The data to be added
   */
  function addData(uint256 _data) public {
    // TODO: Implement the addData function and emit the corresponding event
    data.push(_data);
    emit DataAdded(_data, msg.sender);
  }

  /**
   * @dev Remove data from the array at a specific index and emit an event
   * @param index The index of the data to remove
   */
  function removeData(uint256 index) public {
    // TODO: Implement the removeData function and emit the corresponding event
    uint256 removed = data[index];

    // Make sure to check if the index is within the bounds of the array
    for (uint256 j = index; j < data.length - 1; j++) {
      data[j] = data[j + 1];
    }

    data.pop();
    emit DataRemoved(removed, msg.sender);
  }

  /**
   * @dev Get data at a specific index
   * @param index The index of the data
   * @return The data at the specified index
   */
  function getData(uint256 index) public view returns (uint256) {
    // TODO: Implement the getData function to return data at a specific index
    // Make sure to check if the index is within the bounds of the array
    require(index < data.length, "Out of bounds");
    return data[index];
  }
}
