// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/13_MultiTokenWallet.sol";
import "../src/common/SimpleERC20.sol";

contract MultiTokenWalletTest is Test {
  MultiTokenWallet wallet;
  SimpleERC20 tokenA;
  SimpleERC20 tokenB;

  function setUp() public {
    wallet = new MultiTokenWallet();
    tokenA = new SimpleERC20("Token A", "TKNA", 18);
    tokenB = new SimpleERC20("Token B", "TKNB", 18);

    // Mint some tokens to this test contract
    tokenA.mint(address(this), 1000 ether);
    tokenB.mint(address(this), 1000 ether);
  }

  function testDepositWithdrawToken() public {
    uint256 depositAmount = 100 ether;

    // Deposit Token A
    tokenA.approve(address(wallet), depositAmount);
    wallet.deposit(address(tokenA), depositAmount);

    assertEq(
      wallet.balanceOf(address(tokenA), address(this)),
      depositAmount,
      "Deposit amount should be recorded in the wallet"
    );

    // Withdraw Token A
    wallet.withdraw(address(tokenA), depositAmount);

    assertEq(
      wallet.balanceOf(address(tokenA), address(this)),
      0,
      "Wallet balance should be zero after withdrawal"
    );
    assertEq(
      tokenA.balanceOf(address(this)),
      1000 ether,
      "Token should be returned to the owner after withdrawal"
    );
  }

  // Additional tests can include handling multiple tokens, edge cases, and failure scenarios
}
