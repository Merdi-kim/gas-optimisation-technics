//SPDX-License-Identifier:UNLICENSED 
pragma solidity  ^0.8.0;


/**
 * @dev Retrieving a donator becomes hard/slow once the number of donators grows 
 */
contract DonationArray {
    address[] donators; 
    uint256 donatorsArray;

    function checkDonator(address _donator) external view returns (bool exists) {
        for(uint256 i = 0; i<=donatorsArray;) {
            if(donators[i] == _donator) return true;
            unchecked {
                i++;
            }
        }
    }
}


/**
 * @dev Retrieving a donator is simple and takes one step no matter how many donators are there
 */
contract DonationMapping {
    mapping (address => bool) donators;

    function checkDonator(address _donator) external view returns (bool exists) {
        return donators[_donator];
    }
}