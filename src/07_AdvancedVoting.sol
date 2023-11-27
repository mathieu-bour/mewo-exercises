// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

/**
 * @title AdvancedVoting
 * @dev Basic voting mechanism
 */
contract AdvancedVoting {
  // Voting options are represented as strings
  string[] public options;

  // Mapping from option to number of votes
  mapping(string => uint256) private votes;

  mapping(address => string) private hasVoted;

  // TODO: Declare an event for when a new vote is cast
  event Voted(address who, string what);

  /**
   * @dev Constructor to create a voting contract with given options
   * @param _options The list of voting options
   */
  constructor(string[] memory _options) {
    options = _options;
  }

  modifier onlyValidOption(string memory option) {
    bool found;

    for (uint256 i; i < options.length; i++) {
      if (keccak256(bytes(options[i])) == keccak256(bytes(option))) {
        // options[i] == option
        found = true;
        break;
      }
    }

    require(found, "Choice not found");
    _;
  }

  /**
   * @dev Cast a vote for a given option
   * @param option The option to vote for
   */
  function vote(string memory option) public onlyValidOption(option) {
    require(!hasVoted[msg.sender], "Already voted");

    hasVoted[msg.sender] = true;
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
