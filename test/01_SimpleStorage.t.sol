// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/01_SimpleStorage.sol";

contract SimpleStorageTest is Test {
  SimpleStorage simpleStorage;

  function setUp() public {
    simpleStorage = new SimpleStorage();
  }

  function testStoreRetrieve() public {
    uint256 testValue = 123;
    simpleStorage.store(testValue);
    uint256 retrievedValue = simpleStorage.retrieve();
    assertEq(retrievedValue, testValue, "The retrieved value should match the stored value.");
  }
}
