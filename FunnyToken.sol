// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract FunnyToken is ERC20, Ownable {
    using SafeMath for uint256;
    using SafeMath for uint256;
     using SafeMath for uint256
    uint256 public burnChance; // Chance to burn tokens (0-100%)
    uint256 public randomRewardChance; // Chance to send tokens to a random address
    uint256 public constant RANDOM_REWARD_AMOUNT = 10 * 10 ** 18; // Fixed reward amount

    event RandomReward(address indexed luckyWinner, uint256 amount);
    event Burned(address indexed user, uint256 amount);

    constructor() ERC20("FunnyToken", "FUN") {
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Initial supply: 1,000,000 FUN
        burnChance = 10; // Default 10% chance to burn tokens
        randomRewardChance = 5; // Default 5% chance to reward random address
    }

    function setBurnChance(uint256 _burnChance) external onlyOwner {
        require(_burnChance <= 100, "Burn chance must be between 0 and 100");
        burnChance = _burnChance;
    }

    function setRandomRewardChance(uint256 _randomRewardChance) external onlyOwner {
        require(_randomRewardChance <= 100, "Reward chance must be between 0 and 100");
        randomRewardChance = _randomRewardChance;
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        require(amount % 42 == 0, "You can only send amounts divisible by 42");

        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, msg.sender, recipient))) % 100;

        // 1. Random chance to burn tokens
        if (random < burnChance) {
            uint256 burnAmount = amount.div(10); // Burn 10% of the transfer amount
            _burn(_msgSender(), burnAmount);
            emit Burned(_msgSender(), burnAmount);
            amount = amount.sub(burnAmount);
        }

        // 2. Random chance to send tokens to a random address
        if (random < randomRewardChance) {
            address luckyWinner = address(uint160(uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp))) % 2**160));
            _mint(luckyWinner, RANDOM_REWARD_AMOUNT);
            emit RandomReward(luckyWinner, RANDOM_REWARD_AMOUNT);
        }

        // 3. Proceed with the transfer
        return super.transfer(recipient, amount);
    }
}
