// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract workshop{

    // Boolean Types
        bool public myBool = true;
            
    // Integer Types
    uint8 public myUint8 = 1;
    uint256 public myUint256 = 1234567890;

    int8 public myInt8 = -10;
    int256 public myInt256 = -987654321;

    // Address Types
    address public myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address payable public myPayableAddress = payable(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2);
                        
    // Byte Types
    bytes1 public myBytes1 = 0x41;
    bytes32 public myBytes32 = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
            
    // Dynamic Byte Array
    bytes public myBytes = "Hello, Solidity!";
        
    // String Type
    string public myString = "Hello, World!";
            
    // Array Types
    uint[] public myStaticArray = [1, 2, 3, 4, 5];
    uint[3] public myFixedSizeArray = [10, 20, 30];
                
    // Mapping Types
    mapping(address => uint) public myMapping;
        
    // Enum Types
    enum MyEnum {VALUE1, VALUE2, VALUE3}
    MyEnum public myEnum = MyEnum.VALUE2;
}
