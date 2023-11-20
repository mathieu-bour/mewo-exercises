// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title MultiTokenWallet
 * @dev Contract for handling multiple ERC20 tokens
 */
contract MultiTokenWallet {
  mapping(address => mapping(address => uint256)) public tokenBalances; // token address => owner => balance

  /**
   * @dev Deposits a specified amount of a token into the wallet
   * @param token The address of the ERC20 token
   * @param amount The amount to deposit
   */
  function deposit(address token, uint256 amount) public {
    // TODO: Implement the deposit function
    // Transfer tokens from the sender to this contract
    // Update the token balance in the mapping
  }

  /**
   * @dev Withdraws a specified amount of a token from the wallet
   * @param token The address of the ERC20 token
   * @param amount The amount to withdraw
   */
  function withdraw(address token, uint256 amount) public {
    // TODO: Implement the withdraw function
    // Check if the sender has enough balance
    // Transfer tokens from this contract to the sender
    // Update the token balance in the mapping
  }

  /**
   * @dev Returns the token balance of an address
   * @param token The address of the ERC20 token
   * @param owner The address of the token owner
   * @return The token balance
   */
  function balanceOf(address token, address owner) public view returns (uint256) {
    return tokenBalances[token][owner];
  }
}
