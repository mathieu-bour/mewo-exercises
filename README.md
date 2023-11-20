# Solidity Exercises for Beginners (Mewo 2023)

## Overview

This repository contains a series of practical Solidity exercises designed for beginners in blockchain development. Each exercise focuses on a fundamental aspect of Solidity and smart contract development, providing a hands-on approach to learning.

## Exercises

- [01_SimpleStorage.sol](src/01_SimpleStorage.sol) - Basics of state variables and functions.
- [02_ArrayManager.sol](src/02_ArrayManager.sol) - Managing dynamic arrays in Solidity.
- [03_OwnershipControl.sol](src/03_OwnershipControl.sol) - Implementing access control patterns.
- [04_EventLogger.sol](src/04_EventLogger.sol) - Using events for logging contract actions.
- [05_BasicToken.sol](src/05_BasicToken.sol) - Creating a basic token with minting and transferring capabilities.
- [06_SimpleVoting.sol](src/06_SimpleVoting.sol) - Building a basic voting mechanism.
- [07_TimeBasedActions.sol](src/07_TimeBasedActions.sol) - Implementing time-based logic in contracts.
- [08_PaymentProcessor.sol](src/08_PaymentProcessor.sol) - Handling Ether payments and withdrawals.
- [09_SimpleLottery.sol](src/09_SimpleLottery.sol) - Developing a simple lottery system.
- [10_SimpleDAO.sol](src/10_SimpleDAO.sol) - Introduction to Decentralized Autonomous Organizations (DAOs).
- [11_SimpleERC721.sol](src/11_SimpleERC721.sol) - Introduction to ERC721 and non-fungible tokens (NFTs).
- [12_MultiTokenWallet.sol](12_MultiTokenWallet.sol) - Managing multiple ERC20 tokens in a single contract.
- [13_SimpleStaking.sol](13_SimpleStaking.sol) - Implementing a basic staking mechanism for token rewards.

## Getting Started

### Prerequisites

- Foundry

### Installation

Clone the repository:

```sh
git clone [repository-url]
```

Compile the contracts:

```sh
forge build
```

### Running Tests

To run tests for an exercise, navigate to the test directory and execute the following command:

```sh
forge test --match-contract [TestContractName]
```

For example, to run tests for the first exercise:

```sh
forge test --match-contract SimpleStorageTest
```

## Contributing

Contributions to enhance these exercises or add new ones are welcome. Please follow the standard pull request process to propose changes.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments

- The exercises are designed for educational purposes and provide a foundation for understanding Solidity and smart contract development.
- These exercises are part of the blockchain course curriculum for beginners.
