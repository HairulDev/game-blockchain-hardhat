// // SPDX-License-Identifier: UNLICENSED

// pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";


// contract Transactions is ERC721Enumerable {
//     uint256 public transactionCount;
//     // deklarasi variabel 'transactionCount' dengan tipe data uint256

//     event Transaction(
//         address from,
//         address receiver,
//         uint amount,
//         string message,
//         uint256 timestamp,
//         string keyword
//     );
//     // event untuk memunculkan log ketika terjadi transfer antar akun, berisi beberapa parameter

//     struct TransferStruct {
//         address sender;
//         address receiver;
//         uint amount;
//         string message;
//         uint256 timestamp;
//         string keyword;
//     }
//     // definisi struktur 'TransferStruct' yang berisi beberapa variabel untuk merepresentasikan sebuah transfer

//     TransferStruct[] public transactions;
//     // deklarasi array untuk menyimpan seluruh transfer yang dilakukan

//     constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

//     function addToBlockchain(
//         address payable receiver,
//         uint amount,
//         string memory message,
//         string memory keyword
//     ) public {
//         require(balanceOf(msg.sender) == 0, "You already have a pet");
//         // require(balanceOf(msg.sender) == 1, "You don't have a pet to sell");
//         uint256 tokenId;
//         tokenId = tokenOfOwnerByIndex(msg.sender, 0);
//         safeTransferFrom(msg.sender, receiver, tokenId);
//         transactionCount += 1;
//         transactions.push(
//             TransferStruct(
//                 msg.sender,
//                 receiver,
//                 amount,
//                 message,
//                 block.timestamp,
//                 keyword
//             )
//         );
//         emit Transaction(
//             msg.sender,
//             receiver,
//             amount,
//             message,
//             block.timestamp,
//             keyword
//         );
//     }


//     function getAllTransactions()
//         public
//         view
//         returns (TransferStruct[] memory)
//     {
//         return transactions;
//     }

//     function getTransactionCount() public view returns (uint256) {
//         return transactionCount;
//     }
// }
