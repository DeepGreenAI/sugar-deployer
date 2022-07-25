#!/bin/bash

solana-keygen new --outfile ~/.config/solana/mainnet.json

solana config set --keypair ~/.config/solana/mainnet.json

solana config set --url https://api.metaplex.solana.com/

solana config get

solana address

solana balance