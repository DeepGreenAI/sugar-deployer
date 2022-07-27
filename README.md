# Sugar Deployer: A repo for setting up and deploying a candy machine

This is a helper repo containing bash scripts for setting up the sugar CLI (https://docs.metaplex.com/tools/sugar/) and deploying a candy machine on the solana network. This Repo is set to work with ubuntu 22.04 (LTS) and has not been tested to run on any other OS. You will need to have an `assets` directory set up with all of the NFT images and configs. The assets directory should also contain a collection image (collection.png) and a collection config(collection.json). You will also need a `config.json` file in the root directory containing the candy machine's config file.

# Sugar/Solana Install Script
The first script to run is the installation script for the sugar and solana CLI

> ```bash
> bash 1-install-sugar-solana-bash
> ```

The first thing this script will do is install the sugar CLI. It will also update the openssl/libssl package to fix a packaging issue in ubuntu 22.04 (https://stackoverflow.com/questions/72378647/spl-token-error-while-loading-shared-libraries-libssl-so-1-1-cannot-open-shar)

After sugar is succesfully installed and the packages updated, the script will install the latest stable version of the solana CLI. The script will then update the PATH variable and print out the version of Solana that was installed.

# Solana Wallet Setup Script:

There are two scripts for the set up of the solana wallet and setting the config that will be used for deploying the candy machine. One is for devnet and one is for mainnet.

devnet:
> ```bash
> bash 2-setup-devnet.bash
> ```

mainnet:
> ```bash
> bash 2-setup-mainnet.bash
> ```

# Deploy Candy Machine Script:

This is the script that deploys the candy machine. The first step is that it will run the validate command which will check that all files in the assets folder are in the correct format. The next thing this script will do is run the upload command which uploadss assets to the specified storage (bundlr arweave) and creates the cache file for the Candy Machine. The script will then deploy the candy machine and verify that all items in the cache file have been successfully written on-chain. Finally the script will run the show command which displays the on-chain config of an existing candy machine.

> ```bash
> bash 3-deploy-candy-machine.bash
> ```

# Update Candy Machine Script:

The update script will be used for making changes to the live candy machine. You will simply need to update the config.json to the desired config and then run the update bash script.

> ```bash
> bash 4-update-candy-machine.bash

# Withdraw Rent and Destroy Candy Machine Script:

The withdraw and destroy script will first withdraw all of the solana that is reserved for paying rent from the candy machine. It will then delete the cache.json file so that a new candy machine can be deployed.

> ```bash
> bash 5-withdraw-rent-and-destroy-candy-machine.bash