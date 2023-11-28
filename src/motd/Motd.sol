// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../lib/Ownable.sol";

contract Motd is Ownable {
  string public message;

  constructor(string memory initial) {
    _transferOwnership(msg.sender);
    message = initial;
  }

  function setMessage(string memory newMessage) external onlyOwner {
    message = newMessage;
  }
}
