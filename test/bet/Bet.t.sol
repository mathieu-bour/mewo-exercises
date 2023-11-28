// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../../src/bet/Bet.sol";

contract BetTest is Test {
  Bet bet;

  function setUp() external {
    bet = new Bet();
  }

  function test_createBallot_normal() external {
    string memory question = "hello world?";
    string[] memory choices = new string[](2);
    choices[0] = "yes";
    choices[1] = "no";
    uint256 endDate = 123456789;
    uint256 value = 1 ether;

    uint256 nextBallotId = bet.nextBallotId();
    assertEq(nextBallotId, 0);
    uint256 ballotId = bet.createBallot{ value: value }(BallotInput(question, choices, endDate));
    assertEq(bet.nextBallotId(), 1);
    assertEq(ballotId, nextBallotId);

    (string memory question2, uint256 endDate2, uint256 pot2) = bet.ballots(ballotId);
    assertEq(question2, question);
    assertEq(endDate2, endDate);
    assertEq(pot2, value);
  }

  function test_createBallot_multiple() external {
    string memory question = "hello world?";
    string[] memory choices = new string[](2);
    choices[0] = "yes";
    choices[1] = "no";
    uint256 endDate = 123456789;

    uint256 value1 = 1 ether;
    uint256 ballot1 = bet.createBallot{ value: value1 }(BallotInput(question, choices, endDate));
    (,, uint256 pot1) = bet.ballots(ballot1);
    assertEq(pot1, value1);

    uint256 value2 = 2 ether;
    uint256 ballot2 = bet.createBallot{ value: value2 }(BallotInput(question, choices, endDate));
    (,, uint256 pot2) = bet.ballots(ballot2);
    assertEq(pot2, value2);

    assertEq(address(bet).balance, value1 + value2);
  }
}
