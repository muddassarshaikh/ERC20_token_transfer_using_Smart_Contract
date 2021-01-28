// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";

contract ERC20TokenTransfer is Ownable, Pausable {
  
  IERC20 internal ERC20Interface;                           // ERC20 Interface
  
  /**
   *  Event to notify
   */
  event TransferSuccessful(address indexed from_, address indexed to_, uint256 amount_);

  constructor() {}
  /**
   *  This function transfer token from one address to another using smart contract
   */
  function transferTokens(address tokenAddress_, address to_, uint256 amount_) external whenNotPaused {
    require(tokenAddress_ != address(0x0), "Invalid token address");
    require(to_ != address(0x0), "Invalid receiver address");
    require(amount_ > 0, "Amount should be greater then zero");
    ERC20Interface = IERC20(tokenAddress_);
    require(amount_ <= ERC20Interface.allowance(_msgSender(), address(this)), "Provide approval to smart contract for the given amount");
    ERC20Interface.transferFrom(_msgSender(), to_, amount_);
    emit TransferSuccessful(_msgSender(), to_, amount_);
  }
}