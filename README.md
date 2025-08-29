
FUNDme 💰

A decentralized crowdfunding smart contract built with Solidity and deployed on zkSync testnet. This project allows users to fund the contract with ETH, automatically converts the contribution to its USD value using Chainlink price feeds, and ensures that each contribution meets a minimum USD threshold.

📌 Features

Fund with ETH: Users can contribute ETH to the contract.

Price Conversion: Uses Chainlink price feeds to convert ETH ↔ USD.

Minimum Contribution: Ensures a minimum of $5 USD per contribution.

Contribution Tracking: Keeps track of how many times a user has contributed.

Owner-Only Withdrawals: Only the contract owner can withdraw funds.

Fallback & Receive: Supports plain ETH transfers directly to the contract.

📂 Project Structure
FUNDme/
│── Fundme.sol          # Main crowdfunding smart contract  
│── PriceConverter.sol  # Library for ETH/USD conversion via Chainlink  
│── README.md           # Project documentation  

⚙️ How It Works
PriceConverter Library (PriceConverter.sol)

getPrice() → Returns latest ETH price in USD (scaled to 18 decimals).

getConversionRate() → Converts ETH amount to USD.

convertUsdToEth() → Converts a USD amount into equivalent ETH.

getVersion() → Returns Chainlink price feed version.

Fundme Contract (Fundme.sol)

fund() → Accepts ETH if its USD value ≥ $5.

getContributionCount(address) → Returns number of contributions from a user.

withdraw() → Owner-only function to withdraw all ETH from the contract.

decimalValue() / description() → Fetches price feed metadata.

Fallback & Receive → Auto-trigger fund() when ETH is sent directly.

🛠️ Deployment

Open Remix IDE
 or use Hardhat/Foundry.

Select zkSync Sepolia Testnet as your network.

Deploy the Fundme.sol contract.

The ETH/USD Chainlink price feed address for zkSync Sepolia Testnet is already set in the code:

0xfEefF7c3fB57d18C5C6Cdd71e45D2D0b4F9377bF

🔐 Security

Uses custom error NotOwner() for efficient revert handling.

Funds can only be withdrawn by the owner (contract deployer).

Safe handling of ETH transfers using call().

📜 License

This project is licensed under the MIT License.
