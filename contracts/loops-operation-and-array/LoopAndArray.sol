//SPDX-License-Identifier: UNLICENSED 
pragma solidity ^0.8.0;


/**
 * @dev Since we are incrementing the balance of each account and storing that into the array in storage,
 * It is going to cost much gas for every operation. 
 */
contract LoopAndArray {
    uint256[] balances;
    uint256 balancesLength;

    function incrementBalances() external {
        for(uint256 i = 0; i <= balancesLength;) {
            balances[i] = balances[i] + 2 ether; 
            unchecked {
                i++;
            }
        }
    }
}


/**
 * @dev This solution is saves us more gas because we are copying balances(array in storage) into _balances(memory array)
 * Then we do all the operations on the memory array, which consumes less gas
 * At the end, we store the new array in which every balance got increased by 2 ether into the original array(balances)
 * This means that we're writing to storage only once no matter the length of the array, which is gas efficient 
 */
contract EfficientLoopAndArray {
    uint256[] balances;
    uint256 balancesLength;

    function incrementBalances() external {
        uint256[] memory _balances = balances;
        for(uint256 i = 0; i <= balancesLength;) {
            _balances[i] = _balances[i] + 2 ether; 
            unchecked {
                i++;
            }
        }

        balances = _balances;
    }
}
