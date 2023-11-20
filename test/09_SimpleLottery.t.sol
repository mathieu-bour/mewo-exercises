// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "forge-std/Test.sol";
import "../src/09_SimpleLottery.sol";

contract SimpleLotteryTest is Test {
  SimpleLottery simpleLottery;
  uint256 ticketPrice = 0.01 ether;
  uint256 maxParticipants = 5;

  function setUp() public {
    simpleLottery = new SimpleLottery(ticketPrice, maxParticipants);
  }

  function testEnterLottery() public {
    for (uint256 i = 0; i < maxParticipants; i++) {
      address participant = address(uint160(uint256(keccak256(abi.encodePacked(i)))));
      vm.prank(participant);
      simpleLottery.enterLottery{ value: ticketPrice }();
      assertEq(simpleLottery.getNumberOfParticipants(), i + 1, "Participant count should increase");
    }
  }

  function testEnterLotteryWithIncorrectAmount() public {
    vm.expectRevert("Incorrect ticket price");
    simpleLottery.enterLottery{ value: ticketPrice / 2 }();
  }

  function testEnterLotteryWhenFull() public {
    // Fill up the lottery
    for (uint256 i = 0; i < maxParticipants; i++) {
      address participant = address(uint160(uint256(keccak256(abi.encodePacked(i)))));
      vm.prank(participant);
      simpleLottery.enterLottery{ value: ticketPrice }();
    }

    // Attempt to enter when lottery is full
    vm.expectRevert("Lottery is full");
    address extraParticipant =
      address(uint160(uint256(keccak256(abi.encodePacked(maxParticipants)))));
    vm.prank(extraParticipant);
    simpleLottery.enterLottery{ value: ticketPrice }();
  }

  // This test assumes the implementation of a 'selectWinner' function that gets called when maxParticipants is reached
  function testSelectWinner() public {
    // Enter max participants to trigger winner selection
    for (uint256 i = 0; i < maxParticipants; i++) {
      address participant = address(uint160(uint256(keccak256(abi.encodePacked(i)))));
      vm.prank(participant);
      simpleLottery.enterLottery{ value: ticketPrice }();
    }

    // Verify a winner is selected - this assumes your contract sets a non-zero address as winner
    require(simpleLottery.winner() != address(0), "A winner should be selected");
  }
}
