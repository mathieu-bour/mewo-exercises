// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/13_SimpleStaking.sol";
import "../src/common/SimpleERC20.sol";

contract SimpleStakingTest is Test {
  SimpleStaking stakingContract;
  SimpleERC20 stakingToken;

  function setUp() public {
    stakingToken = new SimpleERC20("Staking Token", "STK", 18);
    stakingToken.mint(address(this), 1000 ether);

    stakingContract = new SimpleStaking(address(stakingToken), 1 ether); // 1 token reward per second

    stakingToken.approve(address(stakingContract), 1000 ether);
  }

  function testStakeAndUnstake() public {
    uint256 stakeAmount = 100 ether;
    stakingContract.stake(stakeAmount);

    // Simulate some time passing
    vm.warp(block.timestamp + 1 days);

    stakingContract.unstake();

    // Assert that the tokens and rewards are correctly returned to the user
    // This assumes specific implementations of stake and unstake in your contract
  }

  function testRewardCalculation() public {
    uint256 stakeAmount = 100 ether;
    stakingContract.stake(stakeAmount);

    // Simulate some time passing
    vm.warp(block.timestamp + 1 days);

    uint256 expectedReward = 1 ether * 1 days; // Assuming 1 token per second reward rate
    uint256 actualReward = stakingContract.calculateReward(address(this));

    assertEq(actualReward, expectedReward, "Reward calculation should match the expected value");
  }

  // Additional tests can include edge cases, failure scenarios, and complex staking logic
}
