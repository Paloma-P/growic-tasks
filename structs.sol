pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol"; 
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract UserBalance {
    
    address public owner;

    mapping(address => uint) public balance;
    
    function deposit (uint256 amount) public payable {
        balance[msg.sender] += amount;
    }
    function checkBalance() public view returns (uint) {
        return balance[msg.sender];
    }

    struct UserDetail{
        string uName;
        uint256 uAge;
    }
     uint public userCount;
     mapping (address => UserDetail) public userdetails;
     //UserDetail[] public userdetails;

     
    //constructor() public {
       // userCount = 0;

     //}
   
    //this function accepts 2 arguments that represent the details of the user calling-
    //the smart contract and it saves them into a defined struct
    function setUserDetails(address uAddress, string calldata name, uint256 age) public {
      userdetails[uAddress].uName = name;
      userdetails[uAddress].uAge = age;
    }
    

    
    function getUserDetails(address uAddress) public view returns (string memory, uint256){
        //UserDetail storage userdetail = userdetails[uAddress];
        return( userdetails[uAddress].uName, userdetails[uAddress].uAge );
    }


}