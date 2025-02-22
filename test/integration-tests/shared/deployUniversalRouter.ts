import hre from 'hardhat'
const { ethers } = hre
import { DexpertUniversalRouter, Permit2 } from '../../../typechain'
import {
  V2_FACTORY_MAINNET,
  V3_FACTORY_MAINNET,
  V2_INIT_CODE_HASH_MAINNET,
  V3_INIT_CODE_HASH_MAINNET,
  ROUTER_REWARDS_DISTRIBUTOR,
  LOOKSRARE_REWARDS_DISTRIBUTOR,
  LOOKSRARE_TOKEN,
} from './constants'

export async function deployRouter(
  permit2: Permit2,
  mockLooksRareRewardsDistributor?: string,
  mockLooksRareToken?: string,
  mockReentrantProtocol?: string
): Promise<DexpertUniversalRouter> {
  const routerParameters = {
    uniswapV2Router02: "0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D",
    feeRecipient: "0x464c7Bb0d5DA8189fD140f153535932d291F7f97",
    feeBaseBps: 1000,
    permit2: permit2.address,
    weth9: '0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2',
    v2Factory: V2_FACTORY_MAINNET,
    v3Factory: V3_FACTORY_MAINNET,
    pairInitCodeHash: V2_INIT_CODE_HASH_MAINNET,
    poolInitCodeHash: V3_INIT_CODE_HASH_MAINNET,
  }

  const routerFactory = await ethers.getContractFactory('DexpertUniversalRouter')
  const router = (await routerFactory.deploy(routerParameters)) as unknown as DexpertUniversalRouter
  await router.setFeeBps(1, 0, 2);
  return router
}

export default deployRouter

export async function deployPermit2(): Promise<Permit2> {
  const permit2Factory = await ethers.getContractFactory('Permit2')
  const permit2 = (await permit2Factory.deploy()) as unknown as Permit2
  return permit2
}

export async function deployRouterAndPermit2(
  mockLooksRareRewardsDistributor?: string,
  mockLooksRareToken?: string
): Promise<[DexpertUniversalRouter, Permit2]> {
  const permit2 = await deployPermit2()
  const router = await deployRouter(permit2, mockLooksRareRewardsDistributor, mockLooksRareToken)
  return [router, permit2]
}
