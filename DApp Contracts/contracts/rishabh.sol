// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract workshop {
    string public myName;
    uint public marks;
    function setName(string memory name) public returns (bool)
    {
        myName=name;
        return true;
    }
    function setAge(uint Age) public returns(bool)
    {
        marks=Age;
        return true;
    }
}