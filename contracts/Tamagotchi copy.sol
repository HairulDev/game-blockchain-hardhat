// // SPDX-License-Identifier: UNLICENSED

// pragma solidity ^0.8.0;

// contract Tamagotchi {
//     struct Pet {
//         uint256 happiness;
//         uint256 hunger;
//         uint256 lastFed;
//     }

//     mapping (address => Pet) public pets;

//     uint256 public constant feedingInterval = 10 seconds;

//     function feed() public {
//         Pet storage pet = pets[msg.sender];
//         require(pet.hunger > 0, "Pet is not hungry");
//         require(block.timestamp >= pet.lastFed + feedingInterval, "It's not time to feed your pet yet");

//         pet.hunger--;
//         pet.lastFed = block.timestamp;
//         pet.happiness++;
//     }

//     function play() public {
//         Pet storage pet = pets[msg.sender];
//         require(pet.happiness > 0, "Pet is not happy");
//         pet.happiness--;
//         pet.hunger++;
//     }

//     function getStatus() public view returns (uint256, uint256, uint256) {
//         Pet storage pet = pets[msg.sender];
//         return (pet.happiness, pet.hunger, pet.lastFed);
//     }

//     function makePetHungry() public {
//         Pet storage pet = pets[msg.sender];
//         pet.hunger++;
//         pet.lastFed = block.timestamp - feedingInterval;
//     }
// }
