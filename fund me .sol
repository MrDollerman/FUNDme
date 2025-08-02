// SPDX-License-Identifier: MIT 
 pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

 contract Fundme{
uint256 minimumUsd = 5;




 function fund() public  payable  {
 //Allow user to send $
//   have a minimun $ of send $5
// how do we send  ETH to this contract?


 require(msg.value >minimumUsd, "dint send enough eth");

 }
// function withdraw () public {}

function getprice() public {
// address 0x694AA1769357215DE4FAC081bf1f309aDC325306
// abi 

}
 


function getconvertionRate() public {

}
function getversion() public view returns (uint256 ) {
return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

}


 }  