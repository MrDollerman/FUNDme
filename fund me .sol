// SPDX-License-Identifier: MIT 
 pragma solidity ^0.8.18;
 import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import {PriceConverter} from "./PriceConverter.sol";

 contract Fundme{
  using PriceConverter for uint256;

uint256 public  minimumUsd = 5e18;

address[] public funders;

mapping (address funder => uint256 amountfunded) public AddressToAmountFunded;

    mapping(address => uint256) public contributionCount;

 function fund() public  payable  {

require(msg.value.getconvertionRate() >= minimumUsd, "dint send enough eth");
funders.push(msg.sender); 
AddressToAmountFunded[msg.sender] += msg.value;

contributionCount[msg.sender] += 1;
 }


 function getContributionCount(address user) public view returns (uint256) {
        return contributionCount[user];
    }


function decimalvalue() public view  returns (uint8) {
return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();

}
function description () public view returns (string memory) {

  return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).description();
}
function convertUsdToEth(uint256 usdamount) public view returns (uint256 ) {
return PriceConverter.convertUsdToEth(usdamount );

}
 function withdraw () public {
  for (uint256 funderindex = 0; funderindex< funders.length ;funderindex++) 
  {
    address funder =funders[funderindex];
    AddressToAmountFunded[funder] =0;
  }

 }

 }  