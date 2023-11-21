// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/02_ArrayManager.sol";

contract ArrayManagerTest is Test {
  ArrayManager arrayManager;

  function setUp() public {
    arrayManager = new ArrayManager();
  }

  function testAddGetValue() public {
    arrayManager.addValue(1);
    arrayManager.addValue(2);
    assertEq(arrayManager.getValue(0), 1, "First value should be 1");
    assertEq(arrayManager.getValue(1), 2, "Second value should be 2");
  }

  function testRemoveValue() public {
    arrayManager.addValue(1); // [1]
    arrayManager.addValue(2); // [1,2]
    arrayManager.removeValue(0); // [2] // [0, 2]
    assertEq(arrayManager.getValue(0), 2, "First value should now be 2");
  }
}
