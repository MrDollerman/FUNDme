//SPDX-License-Identifier:MIT
pragma solidity ^0.8.18;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getprice() internal view returns (uint256) {
// address 0x694AA1769357215DE4FAC081bf1f309aDC325306
// abi 
AggregatorV3Interface pricefeed = AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF);
   (,int answer,,,) =pricefeed.latestRoundData();

// price in terms of usd 
return uint256(answer* 1e10);

}
 


function getconvertionRate(uint256 ETHamount) internal view returns (uint256) {
    // 1 ETH wirth ?

    uint256 ethprice = getprice();
    // (ETHprice* 1.000000000000000000)  / 1e18
    // 1 ethprice in usd = 1 eth 
  uint256  ETHamountinUSD = (ethprice *ETHamount) /1e18;
  return ETHamountinUSD;
}
function getversion() internal view returns (uint256 ) {
return AggregatorV3Interface(0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF).version();

}
   function convertUsdToEth(uint256 usdAmount) internal view returns(uint256){
     uint256 ethPrice = getprice();
    
   uint256  scaledUSD = usdAmount*1e36;

     uint256 ethamount = scaledUSD/ethPrice;
    
     return ethamount ;


}
}