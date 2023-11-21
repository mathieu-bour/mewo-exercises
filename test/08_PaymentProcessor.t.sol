// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/08_PaymentProcessor.sol";

contract PaymentProcessorTest is Test {
  PaymentProcessor paymentProcessor;
  uint256 initialBalance;

  function setUp() public {
    paymentProcessor = new PaymentProcessor();
    initialBalance = address(paymentProcessor).balance;
  }

  receive() external payable { }

  function testReceivePayment() public {
    uint256 paymentAmount = 1 ether;
    payable(address(paymentProcessor)).transfer(paymentAmount);
    assertEq(
      address(paymentProcessor).balance,
      initialBalance + paymentAmount,
      "Payment should increase contract balance"
    );
  }

  function testWithdraw() public {
    uint256 paymentAmount = 1 ether;
    payable(address(paymentProcessor)).transfer(paymentAmount);

    uint256 ownerInitialBalance = address(paymentProcessor.owner()).balance;
    paymentProcessor.withdraw();
    assertEq(
      address(paymentProcessor).balance, 0, "Contract balance should be zero after withdrawal"
    );
    assertEq(
      address(paymentProcessor.owner()).balance,
      ownerInitialBalance + paymentAmount,
      "Owner should receive the withdrawn amount"
    );
  }
}
