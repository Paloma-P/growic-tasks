pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
//import "@openzeppelin/contracts/access/Ownable.sol"; 
//https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol


contract UserBalance {
     // Events task
    event FundsDeposited(address user, uint256 amount);
    event ProfileUpdated(address user);
    address public owner;

    mapping(address => uint) public balance;
    
    function deposit (uint256 amount) public payable {
        balance[msg.sender] += amount;
         // Events task
        emit FundsDeposited(msg.sender, amount);
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
       // Events task
      emit ProfileUpdated(uAddress);
    }
    

    
    function getUserDetails(address uAddress) public view returns (string memory, uint256){
        //UserDetail storage userdetail = userdetails[uAddress];
        return( userdetails[uAddress].uName, userdetails[uAddress].uAge );
    }

    //Modifiers task- Deposit function and mapping already created above in prior tasks
    modifier onlyOwner() {
        require (msg.sender == owner);
        _;
    }
    
    function withdraw() public payable onlyOwner{
        payable(msg.sender).transfer(address(this).balance);
    }

    
     modifier returnNewBalance(uint256 _amount) {
        require(_amount <= uint256(Fee), "AmountToSmall()");
        _;
     }
    uint256 private constant Fee = 20;
    function addFund(uint256 _amount) public returnNewBalance(_amount){
        balance[msg.sender] = balance[msg.sender] + _amount;
    }
    
 
}

