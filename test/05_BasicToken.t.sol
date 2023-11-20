// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/05_BasicToken.sol";

contract BasicTokenTest is Test {
  BasicToken basicToken;
  address recipient = address(0x123);

  function setUp() public {
    basicToken = new BasicToken();
  }

  function testMint() public {
    uint256 mintAmount = 1000;
    basicToken.mint(address(this), mintAmount);
    assertEq(basicToken.balanceOf(address(this)), mintAmount, "Minting should increase balance");
  }

  function testTransfer() public {
    uint256 mintAmount = 1000;
    basicToken.mint(address(this), mintAmount);

    uint256 transferAmount = 500;
    basicToken.transfer(recipient, transferAmount);

    assertEq(
      basicToken.balanceOf(address(this)),
      mintAmount - transferAmount,
      "Transfer should decrease sender's balance"
    );
    assertEq(
      basicToken.balanceOf(recipient),
      transferAmount,
      "Transfer should increase recipient's balance"
    );
  }
}
