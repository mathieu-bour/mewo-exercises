// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract SimpleERC20 is ERC20 {
  uint8 private _decimals;

  constructor(string memory name, string memory symbol, uint8 decimals_) ERC20(name, symbol) { }

  function decimals() public view override returns (uint8) {
    return _decimals;
  }

  function mint(address who, uint256 amount) public {
    _mint(who, amount);
  }
}
