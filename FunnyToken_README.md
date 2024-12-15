# FunnyToken Contract

FunnyToken (FUN) is an ERC-20 token with built-in "fun" mechanics that add randomness and unexpected outcomes to transactions.

## Features

1. **Random Token Burn:** A percentage of tokens may be burned during each transaction (default chance: 10%).
2. **Random Rewards:** Lucky addresses may receive 10 tokens as a reward during transactions (default chance: 5%).
3. **Transfer Restrictions:** Only amounts divisible by 42 are allowed.


## Deployment2. Deploy the contract using Remix, Hardhat, or Truf
1. Clone this repository or copy the contract cod
2. Deploy the contract using Remix, Hardhat, or Truf
1. Clone this repository or copy the contract code.
2. Deploy the contract using Remix, Hardhat, or Truffle.
3. Customize the parameters during deployment:
   - Total supply: `1,000,000 FUN`
 
   one this repository or copy the contract code.
2. Deploy the contract using Remix, Hardhat, or Truffle.
3. Customize the parameters during deployment:
   - Total supply: `1,000,000 FUN`
   - Burn chance: Default `10%`
   - Burn chance: Default `10%`
   e contract using Remix, Hardhat, or Truffle.
3. Customize the parameters during deployment:
   - Total supply: `1,000,000 FUN`git status

   - Reward chance: Default `5%`

   - Total supply: `1,000,000 FUN`git status
   
   - Reward chance: Default `5%`
## Customization


   - Total supply: `1,000,000 FUN`git status
   
   - Reward chance: Default `5%`
## Customization
- **Owner Functions:**
  - `setBurnChance(uint256 _burnChance)`: Adjust the chance of token burning (0–100).
  - `setRandomRewardChance(uint256 _randomRewardChance)`: Adjust the chance of random rewards (0–100).

## Example Usage

1. Transfer tokens divisible by 42.
2. Occasionally, tokens may be burned or random rewards distributed.

## License

This project is licensed under the MIT License.
