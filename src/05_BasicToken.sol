// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title BasicToken
 * @dev Simple token example with basic functionalities
 */
contract BasicToken {
  mapping(address => uint256) private balances;
  uint256 private totalSupply;

  // TODO: Declare an event for token transfer

  /**
   * @dev Mint tokens to a specified address
   * @param to The address to mint tokens to
   * @param amount The amount of tokens to mint
   */
  function mint(address to, uint256 amount) public {
    // TODO: Implement the mint function to mint tokens
    // Update totalSupply and the balance of 'to' address
  }

  /**
   * @dev Transfer tokens from the caller's address to another address
   * @param to The address to transfer tokens to
   * @param amount The amount of tokens to transfer
   */
  function transfer(address to, uint256 amount) public {
    // TODO: Implement the transfer function to transfer tokens
    // Check if the caller's balance is sufficient
    // Update balances of the caller and the 'to' address
    // Emit the transfer event
  }

  /**
   * @dev Get the balance of an address
   * @param account The address to query the balance of
   * @return The balance of the specified address
   */
  function balanceOf(address account) public view returns (uint256) {
    // TODO: Implement the balanceOf function to return the balance of the given address
  }

  /**
   * @dev Get the total supply of tokens
   * @return The total supply of tokens
   */
  function getTotalSupply() public view returns (uint256) {
    // TODO: Implement the getTotalSupply function to return the total supply of tokens
  }
}
