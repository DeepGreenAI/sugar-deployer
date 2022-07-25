#!/bin/bash

solana-keygen new --outfile ~/.config/solana/devnet.json

solana config set --keypair ~/.config/solana/devnet.json

solana config set --url https://metaplex.devnet.rpcpool.com/

solana config get

solana airdrop 2

solana address

solana balance