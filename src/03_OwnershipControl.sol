// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title OwnershipControl
 * @dev Set & change owner
 */
contract OwnershipControl {
  address private owner;

  // Event for ownership transfer
  event OwnershipTransferred(address indexed oldOwner, address indexed newOwner);

  /**
   * @dev Set contract deployer as owner
   */
  constructor() {
    owner = msg.sender;
    emit OwnershipTransferred(address(0), owner);
  }

  /**
   * @dev Modifier to check if caller is owner
   */
  modifier onlyOwner() {
    // TODO: Require that the caller is the owner of the contract
    _;
  }

  /**
   * @dev Change owner
   * @param newOwner The address of the new owner
   */
  function changeOwner(address newOwner) public onlyOwner {
    // TODO: Implement the changeOwner function to allow the current owner to transfer ownership
  }

  /**
   * @dev Return the address of the owner
   * @return Address of the owner
   */
  function getOwner() public view returns (address) {
    return owner;
  }
}
