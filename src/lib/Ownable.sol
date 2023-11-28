// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

abstract contract Ownable {
  address private _owner;

  error OnlyOwner();

  modifier onlyOwner() {
    if (msg.sender != _owner) {
      revert OnlyOwner();
    }
    _;
  }

  function owner() public view returns (address) {
    return _owner;
  }

  function _transferOwnership(address newOwner) internal {
    _owner = newOwner;
  }

  function transferOwnership(address newOwner) public onlyOwner {
    _transferOwnership(newOwner);
  }
}
