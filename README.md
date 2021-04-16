# Tulip Factory

[![Actions Status](https://github.com/tulipswap/tulipswap-core/workflows/CI/badge.svg)](https://github.com/tulipswap/tulipswap-core/actions)

In-depth documentation on TulipSwap is available at [docs.tulipswap.finance](https://docs.tulipswap.finance/).

# Local Development

The following assumes the use of `node@>=10`.

## Install Dependencies

`yarn`

## Compile Contracts

`yarn compile`

## Run Tests

`yarn test`

# Deployment

To deploy the factory contract to a network, rename `installation_data_example.json`
to `installation_data.json` and fill it's values with the required data.

The code below shows how the contract should look. Leave `tulip_factory` blank
as it will be filled in automatically when the contract is deployed.

```
{
  "private_key": {
    "alice": "YOUR_PRIVATE_KEY_HERE"
  },
  "public_key": {
    "alice": "YOUR_PUBLIC_KEY_HERE"
  },
  "contract_address": {
    "tulip_factory": ""
  },
  "provider": {
    "rpc_endpoint": "https://rpc.oasiseth.org:8545"
  }
}
```

Once all the required values are filled in run the command `node deployer.js`
this will deploy your factory contract and fill in the address it was deployed at
in the `tulip_factory` key.

# Oasis Testnet Addresses

Deployer Address: `0xC02656186C435D960E719d7D53ECF92b3ecdCB87`
FeeTo Address: `0xC02656186C435D960E719d7D53ECF92b3ecdCB87`
TulipFactory Address: `0xf75d55dD51EE8756fbDB499cc1A963E702a52091`

[Oasis ETH (OETH) faucet on MainNet Beta](http://faucet.oasiseth.org/)
[scan.oasiseth.org](http://scan.oasiseth.org/)
