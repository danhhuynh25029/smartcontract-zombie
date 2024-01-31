pragma solidity ^0.8.22 ;

contract firstcontract{
    uint saveData;

    function set(uint x) public {
        saveData = x;
    }

    function get() public view returns (uint x) {
        return saveData;
    }

}