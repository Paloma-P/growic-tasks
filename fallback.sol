pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
import "@openzeppelin/contracts/access/Ownable.sol"; 
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract fallbackFunction{
   
    address public owner;
    mapping(address => uint) balance; 
   
    event TransferSuccesful(string func, address transferAddress, uint amount, bytes data);
    // Creating a constructor 
    constructor() public payable {
       owner = msg.sender;  
    }
    
    //fallback function 
    fallback() external payable {
        emit TransferSuccesful("Ether received", msg.sender , msg.value, msg.data);
    }
    receive() external payable{
        emit TransferSuccesful("Ether received", msg.sender , msg.value,  "");
    }    
    function deposit(uint256 _amount) public payable returns (uint256) {
        balance [msg.sender] += _amount;
        require(_amount>= 0 ether, "Amount must be greater than zero");
        return balance[msg.sender];
    }
    
  }
