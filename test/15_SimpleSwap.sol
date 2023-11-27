// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "ds-test/test.sol";
import "../src/15_SimpleSwap.sol";

contract SimpleSwapTest is DSTest {
  SimpleSwap simpleSwap;
  uint256 initialRate = 100;

  function setUp() public {
    simpleSwap = new SimpleSwap(initialRate);
  }

  function testInitialRate() public {
    assertEq(simpleSwap.rate(), initialRate, "Initial rate should be set correctly");
  }

  function testSwapFunctionality() public {
    // TODO: Test the swap functionality - ensure Ether is exchanged for tokens correctly

    // Hints:
    // - Send Ether to the contract and check if the correct amount of tokens is returned
    // - Use `assertEq` to compare expected and actual values
  }

  function testAdminCanChangeRate() public {
    // TODO: Test that the admin can change the exchange rate

    // Hints:
    // - Change the rate using `setRate` function
    // - Assert that the new rate is set correctly
  }

  // TODO (Optional): Write additional tests as needed
}
