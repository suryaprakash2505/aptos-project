module MyModule::NFTStaking {

    use aptos_framework::signer;
    use aptos_framework::coin;
    use aptos_framework::vector;
    use aptos_framework::nft::{Token};

    /// Struct representing the staking pool.
    struct StakingPool has store, key {
        staked_nfts: vector<Token>,  // List of staked NFTs
        total_stake: u64,            // Total staked amount
    }

    /// Function to create a new staking pool.
    public fun create_staking_pool(owner: &signer) {
        let pool = StakingPool {
            staked_nfts: vector::empty<Token>(),
            total_stake: 0,
        };
        move_to(owner, pool);
    }

    /// Function to stake an NFT into the staking pool.
    public fun stake_nft(staker: &signer, pool_owner: address, nft: Token) acquires StakingPool {
        let pool = borrow_global_mut<StakingPool>(pool_owner);

        // Add the NFT to the staked list and increase the total stake
        vector::push_back(&mut pool.staked_nfts, nft);
        pool.total_stake = pool.total_stake + 1;
    }

    /// Function to withdraw a staked NFT from the staking pool.
    public fun withdraw_nft(staker: &signer, pool_owner: address, nft: Token) acquires StakingPool {
        let pool = borrow_global_mut<StakingPool>(pool_owner);

        // Remove the NFT from the staked list and decrease the total stake
        let index = vector::position_of(&pool.staked_nfts, &nft);
        assert!(index.is_some(), 100); // NFT must be staked
        vector::remove(&mut pool.staked_nfts, index.unwrap());
        pool.total_stake = pool.total_stake - 1;

        // Return the NFT to the staker (simulate this with the following line)
        move_to(staker, nft);
    }
}
