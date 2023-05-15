const main = async () => {
  // const transactionsFactory = await hre.ethers.getContractFactory("Transactions");
  // const transactionsContract = await transactionsFactory.deploy("My Transaction", "MTN");
  // await transactionsContract.deployed();
  // console.log("Transactions address: ", transactionsContract.address);

  const Tamagotchi = await hre.ethers.getContractFactory("Tamagotchi");
  const tamagotchi = await Tamagotchi.deploy("My Tamagotchi", "MTAM");
  await tamagotchi.deployed();
  console.log("Tamagotchi deployed to:", tamagotchi.address);


};

const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.error(error);
    process.exit(1);
  }
};

runMain();