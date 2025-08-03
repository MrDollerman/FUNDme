// SPDX-License-Identifier: MIT 
 pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

 contract Fundme{
uint256 minimumUsd = 5e18;

 function fund() public  payable  {
 //Allow user to send $
//   have a minimun $ of send $5
// how do we send  ETH to this contract?


 require(getconvertionRate(msg.value) >= minimumUsd, "dint send enough eth");

 }
// function withdraw () public {}

function getprice() public view returns (uint256) {
// address 0x694AA1769357215DE4FAC081bf1f309aDC325306
// abi 
AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
   (,int answer,,,) =pricefeed.latestRoundData();

// price in terms of usd 
return uint256(answer* 1e18);

}
 


function getconvertionRate(uint256 ETHamount) public view returns (uint256) {
    // 1 ETH wirth ?

    uint256 ethprice = getprice();
    // (ETHprice* 1.000000000000000000)  / 1e18
    // 1 ethprice in usd = 1 eth 
  uint256  ETHamountinUSD = (ethprice *ETHamount) /1e18;
  return ETHamountinUSD;
}
function getversion() public view returns (uint256 ) {
return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();

}
function decimalvalue() public view  returns (uint8) {
return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).decimals();

}

 }  