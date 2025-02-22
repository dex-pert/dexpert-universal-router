import 'hardhat-typechain'
import '@nomiclabs/hardhat-ethers'
import '@nomicfoundation/hardhat-chai-matchers'
import '@nomiclabs/hardhat-etherscan'
import dotenv from 'dotenv'
dotenv.config()

const DEFAULT_COMPILER_SETTINGS = {
  version: '0.8.17',
  settings: {
    viaIR: true,
    evmVersion: 'istanbul',
    optimizer: {
      enabled: true,
      runs: 1_000_000,
    },
    metadata: {
      bytecodeHash: 'none',
    },
  },
}

export default {
  paths: {
    sources: './contracts',
  },
  networks: {
    hardhat: {
      allowUnlimitedContractSize: false,
      chainId: 1,
      forking: {
        url: `https://eth-mainnet.g.alchemy.com/v2/kNPJaYqMx7BA9TcDDJQ8pS5WcLqXGiG7`,
        blockNumber: 15360000,
      },
    },
    mainnet: {
      url: `https://eth-mainnet.g.alchemy.com/v2/kNPJaYqMx7BA9TcDDJQ8pS5WcLqXGiG7`,
    },
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/ssx9MyUJ6pow311FQlrwjYWGmn7o_Zuj`,
      accounts: ["b8ba5bdad45f4308b3f8574a57a8bdb61a76e691226feb635d33484916737f35"]
    },
    base: {
      url: `https://base.llamarpc.com`,
      accounts: ["2f750870f474e1af076f10160b50daf05d948942e5a22eff28b483795de33550"]
    },
    bitLayer: {
      url: `	https://testnet-rpc.bitlayer.org`,
      accounts: ["ddf0d87c8364f888ce8cea57995781797bbd954441deae412ae7922ad0813a9f"]
    },
  },
  namedAccounts: {
    deployer: 0,
  },
  solidity: {
    compilers: [DEFAULT_COMPILER_SETTINGS],
  },
  contractSizer: {
    alphaSort: true,
    runOnCompile: true,
    disambiguatePaths: false,
  },
  mocha: {
    timeout: 60000,
  },
  etherscan: {
    apiKey: {
      mainnet: "DJ26Z7RYREAJJXUZDA3P8QFTUYQN1NB6IN",
      base: "26DA1KNJPI4SMP8GUDAUA4611JIHQK16AD"
    },
  },
}
