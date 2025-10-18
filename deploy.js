const HDWalletProvider = require('@truffle/hdwallet-provider');
const { Web3 } = require('web3');
const { interface, bytecode } = require('./compile')

const provider = new HDWalletProvider(
    'region want mention plug episode gap voice cross dream also item usage',
    'https://sepolia.infura.io/v3/91f637fff8cc4fd9aaf2aeca088bdb0d'
);
const web3 = new Web3(provider);