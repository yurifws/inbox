# Inbox Smart Contract

Simple smart contract for storing and managing messages on the Ethereum blockchain.

## Installation

```bash
npm install
```

## Setup

Create a `.env` file:

```
PRIVATE_KEY=your_private_key
INFURA_API_KEY=your_api_key
```

## Commands

```bash
# Compile contracts
npx hardhat compile

# Run tests
npx hardhat test

# Local deployment
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost

# Testnet deployment
npx hardhat run scripts/deploy.js --network sepolia
```

## Structure

```
contracts/     # Solidity contracts
test/          # Tests
scripts/       # Deployment scripts
ignition/      # Deployment modules
```

## Tech Stack

- Solidity
- Hardhat
- Node.js

## License

MIT