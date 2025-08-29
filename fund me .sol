// SPDX-License-Identifier: MIT 
 pragma solidity ^0.8.18;

 error NotOwner();
 
 import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

import {PriceConverter} from "./PriceConverter.sol";

 contract Fundme{
  using PriceConverter for uint256;

  uint256 public constant MINIMUM_USD = 5e18;

address[] public funders;

mapping (address funder => uint256 amountfunded) public AddressToAmountFunded;

    mapping(address => uint256) public contributionCount;

     address public  immutable  i_owner;

       constructor() {
        i_owner = msg.sender;
    }


 function fund() public  payable  {

require(msg.value.getconvertionRate() >= MINIMUM_USD, "dint send enough eth");
funders.push(msg.sender); 
AddressToAmountFunded[msg.sender] += msg.value;

contributionCount[msg.sender] += 1;
 }


 function getContributionCount(address user) public view returns (uint256) {
        return contributionCount[user];
    }


function decimalvalue() public view  returns (uint8) {
return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF).decimals();

}
function description () public view returns (string memory) {

  return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF).description();
}
function convertUsdToEth(uint256 usdamount) public view returns (uint256 ) {
return PriceConverter.convertUsdToEth(usdamount );
}
    modifier onlyOwner() {
        // require(msg.sender == owner);
        if (msg.sender != i_owner) revert NotOwner();
        _;
    }


 function withdraw () public onlyOwner{
  for (uint256 funderindex = 0; funderindex< funders.length ;funderindex++) 
  {
    address funder =funders[funderindex];
    AddressToAmountFunded[funder] =0;
  }
 funders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }
    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }

 

 }  