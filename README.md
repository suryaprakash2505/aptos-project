# Fractional NFT Staking

## Description
Fractional NFT Staking is a smart contract built on the Aptos blockchain using Move. This contract allows NFT owners to create staking pools where users can stake AptosCoin. It enables fractionalized ownership and utility of NFTs by allowing multiple users to contribute funds toward a shared NFT stake.

## Vision
The goal of this project is to enable a decentralized and transparent mechanism for NFT staking, increasing liquidity and engagement in NFT-based ecosystems. By allowing fractional staking, this contract lowers the entry barrier for users who want to participate in NFT ownership and staking rewards.

## Future Scope
- **Reward Distribution**: Implementing reward mechanisms for stakers based on their contribution.
- **Unstaking Mechanism**: Allow users to withdraw their staked assets.
- **Multi-Token Support**: Expanding staking functionality to support multiple tokens.
- **Governance Mechanism**: Allowing NFT stakeholders to vote on NFT-related decisions.

## Contract Details
### Module: `MyModule::FractionalNFTStaking`

#### Structs:
- **StakePool**: Represents an NFT stake pool with:
  - `total_staked`: Total amount staked.
  - `nft_owner`: Address of the NFT owner.

#### Functions:
1. **`create_pool(owner: &signer)`**
   - Creates a staking pool for an NFT.
   - Stores `total_staked` as `0` and assigns the `nft_owner`.

2. **`stake_tokens(staker: &signer, pool_owner: address, amount: u64) acquires StakePool`**
   - Allows users to stake AptosCoin into the pool.
   - Transfers coins from the staker to the pool owner.
   - Updates the total staked amount in the pool.
   - contract addres : "0xd3fb6574d64996f8d19b4d55ee964c55f5663dcf204596ee938d3cd34a28c8e6"
![image](https://github.com/user-attachments/assets/8f0f89e7-01a7-4395-8dfa-01c2bfd17cb9)

This contract serves as a foundation for NFT-based staking mechanisms on Aptos, with potential for further enhancements and integrations.

