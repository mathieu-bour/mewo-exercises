// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../lib/Ownable.sol";

contract Motd_v2 {
  mapping(address => bool) public admins;
  mapping(address => bool) public modos;

  string public message;

  constructor(string memory initial) {
    message = initial;
    admins[msg.sender] = true;
  }

  modifier onlyAdmin() {
    require(admins[msg.sender], "Only admin");
    _;
  }

  modifier onlyModo() {
    require(modos[msg.sender] || admins[msg.sender], "Only modo or admin");
    _;
  }

  function setMessage(string memory newMessage) external onlyModo {
    message = newMessage;
  }

  function setAdmin(address who, bool isAdmin) external onlyAdmin {
    admins[who] = isAdmin;
  }

  function setModo(address who, bool isModo) external onlyAdmin {
    modos[who] = isModo;
  }
}
