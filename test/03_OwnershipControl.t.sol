// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/03_OwnershipControl.sol";

contract OwnershipControlTest is Test {
  OwnershipControl ownershipControl;
  address newOwner = address(0x123);

  function setUp() public {
    ownershipControl = new OwnershipControl();
  }

  function testInitialOwner() public {
    assertEq(ownershipControl.getOwner(), address(this), "Deployer should be the owner");
  }

  function testChangeOwner() public {
    ownershipControl.changeOwner(newOwner);
    assertEq(ownershipControl.getOwner(), newOwner, "Owner should be changed to newOwner");
  }
}
