// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

/**
 * @title SimpleERC721
 * @dev Simple ERC721 Token example
 */
contract SimpleERC721 is ERC721 {
  uint256 private nextTokenId;
  address public admin;

  /**
   * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
   */
  constructor() ERC721("SimpleERC721", "SERC721") {
    // TODO: Set the admin as the message sender
  }

  /**
   * @dev Mints a new token to the specified address.
   * @param to The address to mint the token to.
   */
  function mint(address to) public {
    // TODO: Implement the mint function
    // Ensure that only the admin can mint new tokens
    // Use _safeMint to mint the token and increment nextTokenId
  }

  // TODO: Add any additional functions or overrides required for the ERC721 standard
}
