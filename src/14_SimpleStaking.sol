// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

/**
 * @title SimpleStaking
 * @dev Contract for staking tokens and earning rewards
 */
contract SimpleStaking {
  IERC20 public stakingToken;

  mapping(address => uint256) public stakes;
  mapping(address => uint256) public stakingTime;

  // Define the reward rate per second for staking
  uint256 public rewardRate;

  // TODO: Declare events for staking, unstaking, and claiming rewards

  constructor(address _stakingTokenAddress, uint256 _rewardRate) {
    stakingToken = IERC20(_stakingTokenAddress);
    rewardRate = _rewardRate;
  }

  /**
   * @dev Function for staking tokens
   * @param amount The amount of tokens to stake
   */
  function stake(uint256 amount) public {
    // TODO: Implement the staking logic
    // Transfer tokens from the sender to this contract
    // Record the staking amount and time
  }

  /**
   * @dev Function for unstaking tokens and claiming rewards
   */
  function unstake() public {
    // TODO: Implement the unstaking and reward claiming logic
    // Calculate the rewards based on staked time and amount
    // Transfer staked tokens and rewards back to the sender
  }

  /**
   * @dev Function to calculate the current reward for an address
   * @param account The address to calculate rewards for
   * @return The calculated reward
   */
  function calculateReward(address account) public view returns (uint256) {
    // TODO: Implement the reward calculation logic
  }
}
