// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/04_EventLogger.sol";

contract EventLoggerTest is Test {
  EventLogger eventLogger;

  function setUp() public {
    eventLogger = new EventLogger();
  }

  function testAddMultipleData() public {
    uint256[] memory testData = new uint256[](3);
    testData[0] = 42;
    testData[1] = 55;
    testData[2] = 78;

    for (uint256 i = 0; i < testData.length; i++) {
      vm.expectEmit(true, true, false, true);
      emit EventLogger.DataAdded(testData[i], address(this));
      eventLogger.addData(testData[i]);
    }
  }

  function testRemoveData() public {
    eventLogger.addData(42);
    vm.expectEmit(true, true, false, true);
    emit EventLogger.DataRemoved(42, address(this));
    eventLogger.removeData(0);
  }
}
