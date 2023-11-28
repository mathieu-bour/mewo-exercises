// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../../src/lib/Ownable.sol";
import "../../src/motd/Motd_v2.sol";

contract Motd_v2Test is Test {
  Motd_v2 motd;

  address admin = address(0x123);
  address modo = address(0x123674748);
  address user = address(0x456);

  string oldMessage = "Hello world";
  string newMessage = "new message";

  function setUp() external {
    vm.startPrank(admin);
    motd = new Motd_v2(oldMessage); // Deploy motd as admin user
    motd.setModo(modo, true);
    vm.stopPrank();
  }

  function test_setMessage_admin() external {
    vm.prank(admin);
    motd.setMessage(newMessage);
    assertEq(motd.message(), newMessage);
  }

  function test_setMessage_modo() external {
    vm.prank(modo);
    motd.setMessage(newMessage);
    assertEq(motd.message(), newMessage);
  }

  function test_setMessage_user() external {
    vm.prank(user);
    vm.expectRevert();
    motd.setMessage(newMessage);
    assertEq(motd.message(), oldMessage);
  }

  function test_setAdmin_adminPromotesUserToAdminThenUserDemotesHimself() external {
    vm.prank(admin);
    motd.setAdmin(user, true);
    assertTrue(motd.admins(user));

    vm.prank(user);
    motd.setAdmin(user, false);
    assertFalse(motd.admins(user));
  }

  function test_setAdmin_modoRevert() external {
    vm.prank(modo);
    vm.expectRevert();
    motd.setAdmin(modo, true);
    assertFalse(motd.admins(modo));
  }

  function test_setAdmin_userRevert() external {
    vm.prank(user);
    vm.expectRevert();
    motd.setAdmin(user, true);
    assertFalse(motd.admins(user));
  }

  function test_setModo_adminPromotesUserToModerator() external {
    vm.prank(admin);
    motd.setModo(user, true);
    assertTrue(motd.modos(user));
  }

  function test_setModo_modoRevert() external {
    vm.prank(modo);
    vm.expectRevert();
    motd.setModo(user, true);
    assertFalse(motd.modos(user));
  }

  function test_setModo_userRevert() external {
    vm.prank(user);
    vm.expectRevert();
    motd.setModo(user, true);
    assertFalse(motd.modos(user));
  }
}
