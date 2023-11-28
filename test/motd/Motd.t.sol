// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../../src/lib/Ownable.sol";
import "../../src/motd/Motd.sol";

contract MotdTest is Test {
  Motd motd;

  address admin = address(0x123);
  address user = address(0x456);

  function setUp() external {
    vm.prank(admin);
    motd = new Motd("Hello world"); // Deploy motd as admin user
  }

  function test_transferOwnership_admin() external {
    assertEq(motd.owner(), admin);

    vm.prank(admin);
    motd.transferOwnership(user);

    assertEq(motd.owner(), user);
  }

  function test_transferOwnership_user() external {
    vm.prank(user);
    // vm.expectRevert();
    vm.expectRevert(Ownable.OnlyOwner.selector); // better: more precise
    motd.transferOwnership(user);
  }

  function test_setMessage_admin() external { }

  function test_setMessage_user() external { }
}
