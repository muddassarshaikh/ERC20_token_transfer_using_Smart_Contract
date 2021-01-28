// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SampleToken is ERC20, Ownable {
  constructor() ERC20("Sample Token", "sT") {
    _mint(msg.sender, 75000 * 10 ** 18);
  }
}