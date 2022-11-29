require("dotenv").config();
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));
// import { Alchemy, Network } from "alchemy-sdk";
const { Alchemy, Network } = require("alchemy-sdk");

const config = {
  apiKey: process.env.ALCHEMY_APIKEY,
  network: Network.ETH_GOERLI,
};
const alchemy = new Alchemy(config);

const main = async () => {
    // const nfts = await alchemy.nft.getNftsForOwner("0xc8df20395e287af4564c05546d0ec83c4c6319ae");
    // console.log(nfts);

console.log("fetching metadata for SOUL Token...");
// const response = await alchemy.nft.getNftMetadata(process.env.NFT_CONTRACT_ADDRESS,"0");
// console.log(response);

// Print total NFT count returned in the response:
// alchemy.nft.getOwnersForNft(process.env.NFT_CONTRACT_ADDRESS, "1").then(
//   console.log 
// );
const response = await alchemy.nft.getOwnersForNft(process.env.NFT_CONTRACT_ADDRESS, "0");
console.log(response);

const owner = await alchemy.nft.getOwnersForContract(`${process.env.NFT_CONTRACT_ADDRESS}`);
console.log(owner);


// Execute the code
const runMain = async () => {
  try {
    await main();
    process.exit(0);
  } catch (error) {
    console.log(error);
    process.exit(1);
  }
};

runMain();