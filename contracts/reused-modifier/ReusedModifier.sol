//SPDX-License-Identifier:UNLICENSED 
pragma solidity ^0.8.0;

/**
 * @dev modifier code gets copied everywhere the modifier is used. 
 * In this case, it gets copied 3 times, which is gas unefficient 
 */
contract NormalModifier {
    mapping (address => bool) allowedUsers;

    modifier onlyAllowedUser {
        require(allowedUsers[msg.sender], "Not allowed");
        _;
    }

    function getAccess() external view onlyAllowedUser {}
    function getAvailability() external view onlyAllowedUser {}
    function setAvailability() external onlyAllowedUser {}
}


/**
 * @dev modifier code does not get copied everywhere the modifier is used.
 * Imstead, it only points to the function that contains the logic
 * This method is gas efficient because it avoids code redundancy 
 */
contract ReusedModifier {
    mapping (address => bool) allowedUsers;

    function checkUserAccess() public view {
        require(allowedUsers[msg.sender], "Not allowed");
    }

    modifier onlyAllowedUser {
        checkUserAccess();
        _;
    }

    function getAccess() external view onlyAllowedUser {}
    function getAvailability() external view onlyAllowedUser {}
    function setAvailability() external onlyAllowedUser {}
}