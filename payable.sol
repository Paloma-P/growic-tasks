pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol"; 
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract UserBalance {
    
    address public owner;
   
    mapping(address => uint) public balance;
    
     function deposit() public payable {}
    function checkBalance() public view returns (uint) {
        return address(this).balance;
    }
    
}