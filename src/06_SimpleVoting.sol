// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title SimpleVoting
 * @dev Basic voting mechanism
 */
contract SimpleVoting {
  // Voting options are represented as strings
  string[] public options;

  // Mapping from option to number of votes
  mapping(string => uint256) private votes;

  // TODO: Declare an event for when a new vote is cast
  event Voted(address who, string what);

  /**
   * @dev Constructor to create a voting contract with given options
   * @param _options The list of voting options
   */
  constructor(string[] memory _options) {
    options = _options;
  }

  /**
   * @dev Cast a vote for a given option
   * @param option The option to vote for
   */
  function vote(string memory option) public {
    // TODO: Implement the vote function to cast a vote
    // Increment the vote count for the chosen option
    // Emit the vote cast event

    bool found;

    for (uint256 i; i < options.length; i++) {
      if (keccak256(bytes(options[i])) == keccak256(bytes(option))) {
        // options[i] == option
        found = true;
        break;
      }
    }

    require(found, "Choice not found");

    votes[option]++;
    emit Voted(msg.sender, option);
  }

  /**
   * @dev Get the total votes for a given option
   * @param option The option to query
   * @return The total votes for the option
   */
  function totalVotesFor(string memory option) public view returns (uint256) {
    // TODO: Implement the totalVotesFor function to return the total votes for a given option
    return votes[option];
  }
}
