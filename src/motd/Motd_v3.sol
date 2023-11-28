// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "../lib/Ownable.sol";

contract Motd_v2 {
  uint256 public constant ADMIN = 1;
  uint256 public constant MODO = 2;

  // 0b000000
  // 0b000001
  // 0b000010
  // 0b000011
  mapping(address => uint256) public roles;

  string public message;

  constructor(string memory initial) {
    message = initial;
    roles[msg.sender] = ADMIN;
  }

  modifier onlyAdmin() {
    require(roles[msg.sender] & ADMIN != 0, "Only admin");
    _;
  }

  modifier onlyModo() {
    require(roles[msg.sender] & MODO != 0, "Only modo or admin");
    _;
  }

  function setMessage(string memory newMessage) external onlyModo {
    message = newMessage;
  }

  function setrole(address who, uint256 _roles) external onlyAdmin {
    roles[who] = _roles;
  }
}
