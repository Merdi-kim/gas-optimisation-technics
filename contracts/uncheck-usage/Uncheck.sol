//SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0; 

/**
 * @dev Here we have an extra check for overflow/underflow
 */
contract Uncheck {
    address[] customers; 
    uint256 customerArrayLength; 

    function checkCustomer( address _customer) external view returns(bool isCustomer ) {
        for(uint256 i=0; i<customerArrayLength; i++) {
            if(customers[i] == _customer) return true;
        }
    }
}



/**
 * @dev By wrapping an `unchecked` around the increment, we do not check for overflow/underflow while incrementing 
 * That is because we have our own logic `i<customerArrayLength` that will prevent overflow 
 */
contract EfficientUncheck {
    address[] customers; 
    uint256 customerArrayLength; 

    function checkCustomer( address _customer) external view returns(bool isCustomer) {
        for(uint256 i=0; i<customerArrayLength;) {
            if(customers[i] == _customer) return true;
            unchecked {
                i++;
            }
        }
    }
}