// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

struct Vote {
  uint256 choice;
  uint256 value;
}

struct Ballot {
  string question;
  string[] choices;
  uint256 endDate;
  uint256 pot;
  mapping(address => Vote) votes;
}

struct BallotInput {
  string question;
  string[] choices;
  uint256 endDate;
}

// envoyer de l'ether
// bet.createBallot{value: 1 ether}(...args)
//
// balance d'un contrat:
// address(bet).balance

contract Bet {
  uint256 public nextBallotId = 0;
  mapping(uint256 => Ballot) public ballots;

  function createBallot(BallotInput memory ballot) external payable returns (uint256 ballotId) {
    ballots[nextBallotId].question = ballot.question;
    ballots[nextBallotId].choices = ballot.choices;
    ballots[nextBallotId].endDate = ballot.endDate;
    ballots[nextBallotId].pot = msg.value;
    nextBallotId++;
    return nextBallotId - 1;
  }

  function vote(uint256 ballotId, uint256 choice) external payable {
    ballots[ballotId].votes[msg.sender].choice = choice;
    ballots[ballotId].votes[msg.sender].value += msg.value;
    ballots[ballotId].pot += msg.value;
  }
}
