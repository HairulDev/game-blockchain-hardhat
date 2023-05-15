// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Tamagotchi is ERC721Enumerable {

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    struct Pet {
        uint256 happiness;
        uint256 hunger;
        uint256 lastFed;
    }

    mapping (address => Pet) public pets;

    uint256 public constant feedingInterval = 10 seconds;


    uint256 public transactionCount;

    event Transaction(
        address from,
        address receiver,
        uint amount,
        string message,
        uint256 timestamp,
        string keyword,
        uint256 tokenId
    );
    // event untuk memunculkan log ketika terjadi transfer antar akun, berisi beberapa parameter

    struct TransferStruct {
        address sender;
        address receiver;
        uint amount;
        string message;
        uint256 timestamp;
        string keyword;
        uint256 tokenId;
    }
    // definisi struktur 'TransferStruct' yang berisi beberapa variabel untuk merepresentasikan sebuah transfer

    TransferStruct[] public transactions;
    // deklarasi array untuk menyimpan seluruh transfer yang dilakukan


    function addToBlockchain(
        address payable receiver,
        uint amount,
        string memory message,
        string memory keyword,
        uint256 tokenId,
        uint256 happiness,
        uint256 hunger,
        uint256 lastFed
    ) public {
        require(balanceOf(msg.sender) == 1, "You don't have a pet to burn");
        tokenId = tokenOfOwnerByIndex(msg.sender, 0);
        safeTransferFrom(msg.sender, receiver, tokenId);
        transactionCount += 1;
        transactions.push(
            TransferStruct(
                msg.sender,
                receiver,
                amount,
                message,
                block.timestamp,
                keyword,
                tokenId
            )
        );
        pets[receiver] = Pet(happiness, hunger, lastFed);
        emit Transaction(
            msg.sender,
            receiver,
            amount,
            message,
            block.timestamp,
            keyword,
            tokenId
        );
    }

    function getAllTransactions()
        public
        view
        returns (TransferStruct[] memory)
    {
        return transactions;
    }

    function getTransactionCount() public view returns (uint256) {
        return transactionCount;
    }


    function feed() public {
        Pet storage pet = pets[msg.sender];
        require(pet.hunger > 0, "Pet is not hungry");
        require(pet.happiness <= 5, "Pet is full");
        require(block.timestamp >= pet.lastFed + feedingInterval, "It's not time to feed your pet yet try again 10 seconds");

        pet.hunger--;
        pet.lastFed = block.timestamp;
        pet.happiness++;
    }

    function play() public {
        Pet storage pet = pets[msg.sender];
        require(pet.happiness > 0, "Pet is not happy");
        pet.happiness--;
        pet.hunger++;
    }

    function getStatus() public view returns (uint256, uint256, uint256) {
        Pet storage pet = pets[msg.sender];
        return (pet.happiness, pet.hunger, pet.lastFed);
    }

    function getPet(uint256 indexPet) public view returns (uint256) {
        uint256 tokenId = tokenOfOwnerByIndex(msg.sender, indexPet);
        return tokenId;
    }

    function makePetHungry() public {
        Pet storage pet = pets[msg.sender];
        pet.hunger = 5;
        pet.lastFed = block.timestamp - feedingInterval;
    }

    function mint() public {
        require(balanceOf(msg.sender) == 0, "You already have a pet");
        uint256 tokenId = uint256(keccak256(abi.encodePacked(msg.sender, block.timestamp)));
        _safeMint(msg.sender, tokenId);
        pets[msg.sender] = Pet(0, 5, block.timestamp);
    }

    function deletePet() public {
        require(balanceOf(msg.sender) == 1, "You don't have a pet");
        uint256 tokenId = tokenOfOwnerByIndex(msg.sender, 0);
        _burn(tokenId);
        delete pets[msg.sender];
    }
}
