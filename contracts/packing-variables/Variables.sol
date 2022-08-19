//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


/** 
 * @dev These variables will take 3 storage slots 
*/ 
contract VariablesPacking {
    uint64 firstNumber;           // 1 storage slot
    uint256 sum;                 //1 storage slot 
    uint64 secondNumber;        // 1 storage slot
}



/** 
 * @dev These variables will take only 2 storage slots 
*/ 
contract EfficientVariablesPacking {
    uint64 firstNumber;         // this will be packed with `secondNumber`
    uint64 secondNumber;       // this will be packed with `firstNumber` into one storage slot 
    uint256 sum;              // 1 storage slot
}