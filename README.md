# 📦 Inbox - Foundry Project

A simple smart contract to store and update messages on the Ethereum blockchain, built with Foundry.

## 📋 About The Project

This is a sample project demonstrating:
- ✅ Smart contract development with Solidity
- ✅ Automated testing with Foundry
- ✅ Deployment on local network (Anvil) and testnet (Sepolia)
- ✅ Contract verification on Etherscan
- ✅ Interaction via command line (cast)

## 🔧 Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Git](https://git-scm.com/downloads)
- Ethereum wallet (MetaMask recommended)
- Sepolia testnet ETH ([Faucet](https://sepoliafaucet.com/))

## 🚀 Installation

1. **Clone the repository:**
```bash
git clone <your-repository>
cd inbox
```

2. **Install dependencies:**
```bash
forge install
```

3. **Set up environment variables:**

Create a `.env` file in the project root:
```env
PRIVATE_KEY=your_private_key_without_0x
SEPOLIA_RPC_URL=https://sepolia.infura.io/v3/YOUR_INFURA_KEY
ETHERSCAN_API_KEY=your_etherscan_api_key
```

⚠️ **IMPORTANT:** Never commit the `.env` file! Always use a test wallet.

## 📁 Project Structure
```
inbox/
├── src/
│   └── Inbox.sol              # Main contract
├── test/
│   └── Inbox.t.sol            # Tests
├── script/
│   └── DeployInbox.s.sol      # Deploy script
├── lib/                        # Dependencies
├── foundry.toml               # Foundry configuration
├── .env                       # Environment variables (do not commit!)
├── .gitignore
└── README.md
```

## 🔨 Main Commands

### Compile
```bash
forge build
```

### Test
```bash
# Run all tests
forge test

# With details
forge test -vvvv

# Test specific function
forge test --match-test testSetMessage -vvvv

# Gas report
forge test --gas-report
```

### Clean cache
```bash
forge clean
```

## 🏠 Local Deployment (Anvil)

### 1. Start local node:
```bash
anvil
```

### 2. In another terminal, deploy:
```bash
forge script script/DeployInbox.s.sol:DeployInbox \
  --rpc-url http://localhost:8545 \
  --broadcast \
  -vvvv
```

### 3. Interact with the contract:
```bash
# Read message
cast call <CONTRACT_ADDRESS> "message()" \
  --rpc-url http://localhost:8545 | cast --to-ascii

# Update message
cast send <CONTRACT_ADDRESS> "setMessage(string)" "New message" \
  --rpc-url http://localhost:8545 \
  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
```

## 🌐 Sepolia Deployment

### 1. Load environment variables:
```bash
source .env
```

### 2. Deploy:
```bash
forge script script/DeployInbox.s.sol:DeployInbox \
  --rpc-url $SEPOLIA_RPC_URL \
  --broadcast \
  --verify \
  -vvvv
```

### 3. Interact with the contract:
```bash
# Read message
cast call <CONTRACT_ADDRESS> "message()" \
  --rpc-url $SEPOLIA_RPC_URL | cast --to-ascii

# Update message
cast send <CONTRACT_ADDRESS> "setMessage(string)" "New message" \
  --rpc-url $SEPOLIA_RPC_URL \
  --private-key $PRIVATE_KEY
```

## 📝 Main Contract

### Inbox.sol
```solidity
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract Inbox {
    string public message;
    
    constructor(string memory initialMessage) {
        message = initialMessage;
    }
    
    function setMessage(string memory newMessage) public {
        message = newMessage;
    }
}
```

### Features:
- **message()** - Returns the currently stored message
- **setMessage(string)** - Updates the stored message

## 🧪 Tests

Tests cover:
- ✅ Initial message verification
- ✅ Message update
- ✅ Empty message
- ✅ Long message
- ✅ Multiple updates

Run:
```bash
forge test -vv
```

## 🔗 Useful Links

- **Foundry Book:** https://book.getfoundry.sh/
- **Solidity Docs:** https://docs.soliditylang.org/
- **Sepolia Faucet:** https://sepoliafaucet.com/
- **Etherscan Sepolia:** https://sepolia.etherscan.io/
- **Remix IDE:** https://remix.ethereum.org/

## 🛠️ Built With

- **Solidity 0.8.19** - Programming language
- **Foundry** - Development framework
- **Forge** - Build and test tool
- **Cast** - Contract interaction tool
- **Anvil** - Local Ethereum node

## 📜 License

This project is licensed under the MIT License.

## 🤝 Contributing

Contributions are welcome! Feel free to open issues and pull requests.

## ⚠️ Security Warnings

- 🔒 **NEVER** commit your private key
- 🔒 **NEVER** use your main wallet for testing
- 🔒 **ALWAYS** add `.env` to `.gitignore`
- 🔒 **ALWAYS** verify contracts on Etherscan after deployment

## 📞 Support

If you have questions:
1. Check the [Foundry documentation](https://book.getfoundry.sh/)
2. Open an issue in this repository
3. Join the [Foundry Discord community](https://discord.gg/foundry)

---

**Built with ❤️ using Foundry**