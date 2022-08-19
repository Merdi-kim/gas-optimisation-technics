//SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0;

contract CustomError {

    address payable owner; 

    /** 
      * @dev message string gets stored in storage and costs gas
     */
    function sendTokens(uint256 _amount) external payable {
        require(_amount > 0, "Amount cannot be zero");
        owner.transfer(_amount);
    }
}


contract EfficientCustomError {

    error UnsufficientFunds(uint256 amount);
    address payable owner; 

    /**
     * @dev No message string stored. Instead a custom error is used and hence we save some gas
     */
    function sendTokens(uint256 _amount) external payable {
        if(_amount <= 0) {
            revert UnsufficientFunds(_amount);
        }
        owner.transfer(_amount);
    }
}