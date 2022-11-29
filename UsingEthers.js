const ethers = require('ethers');
require("dotenv").config();
const fetch = (...args) => import('node-fetch').then(({default: fetch}) => fetch(...args));

async function main(){
const response = await fetch
(`https://api-goerli.etherscan.io/api?module=contract&action=getabi&address=${process.env.CONTRACT_ADDRESS}&apikey=${process.env.ETHERSCAN_APIKEY}`);
const abi_response = await response.json();
const abi =abi_response.result;
// const address='0xACa03191FeB00489FD5BCD4FD84c716A309309E1';
const address=`${process.env.CONTRACT_ADDRESS}`;
const provider = new ethers.providers.WebSocketProvider(process.env.ALCHEMY_WEBSOCKET_URL);
const contract = new ethers.Contract(address,abi,provider);

contract.on("Transfer",(from, to, tokenId, event)=>{
   let  str = {
        from: from,
        to: to,
        tokenId: ethers.utils.formatUnits(tokenId)
    }
    console.log(JSON.stringify(str));
});

}

main();