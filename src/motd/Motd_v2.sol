// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../lib/Ownable.sol";

contract Motd_v2 {
  string public message;

  constructor(string memory initial) {
    message = initial;
    msg.sender;
  }

  modifier onlyAdmin() {
    _;
  }

  modifier onlyModo() {
    _;
  }

  function setMessage(string memory newMessage) external onlyModo {
    message = newMessage;
  }

  // function changeRole()
}
