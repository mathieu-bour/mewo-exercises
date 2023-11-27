// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/12_SimpleERC721.sol";

contract SimpleERC721Test is Test {
  SimpleERC721 simpleERC721;

  function setUp() public {
    simpleERC721 = new SimpleERC721();
  }

  function testMint() public {
    address recipient = address(0x123);
    simpleERC721.mint(recipient);

    uint256 tokenId = 0; // Assuming first minted token has ID 0
    assertEq(simpleERC721.ownerOf(tokenId), recipient, "Recipient should own the minted token");
  }
}
