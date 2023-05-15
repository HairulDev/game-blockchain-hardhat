require('@nomiclabs/hardhat-waffle');

module.exports = {
  solidity: "0.8.4",
  solidity: {
    compilers: [
      { version: "0.8.1" },
      { version: "0.8.0" }
    ]
  },
  networks: {
    // ropsten: {
    //   url: 'https://eth-ropsten.alchemyapi.io/v2/z4WpA8UKgqnwbTYmrZu15yCOiijBKaRv',
    //   accounts: ['2f99db8cdb04655028eee1dc98230925202f6b3e010e43fad2883b4bea90a1a3'],
    // },
    localhost: {
      url: 'http://localhost:8545',
      accounts: ['4bbbf85ce3377467afe5d46f804f221813b2bb87f24d81f60f1fcdbf7cbf4356'],
    },
  },
};

