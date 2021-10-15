# Uniswap DEMO

This is a demo implementation to exemplify how to use Uniswap contracts.


In order to have a good experience througth this tutorial, please make sure you have all the requirements bellow pre-configured, or go to the next section **installation**:

- Windows, Linux or Mac OS X
- NodeJS v8.9.4 or later
- Truffle

## Installation
[Node.js](https://nodejs.org/en/download/package-manager/) <br>
[Truffle](https://www.trufflesuite.com/docs/truffle/getting-started/installation)

## How to run

### Install dependencies

Run `npm install`

### Deploy smart contracts

Run `truffle migrate --reset`

### Test smart contract

In order to tests we need to run ```ganache-cli``` pointing to testnet or none Uniswap contract could be found, and our tests will fail.

To do that make sure you had installed **ganache-cli**, if you didn't just run ```npm i ganache-cli``` at first. <br>
Once everything is ok execute the commands bellow:

```
ganache-cli -f https://mainnet.infura.io/v3/${INFURA_PROJECT_ID}
```

This command tells ganache to run as fork of mainnet, it help us to have access to mainnet actual state, but with no effect into the mainnet as we are working at localhost.
For more information about how to use **ganache-cli --fork** command, I recommend you to take a look at this video tutorial => [Ganache CLI: (SECRET FEATURE!) Fork Mainnet for easy smart contract testing](https://www.youtube.com/watch?v=9X78nFqJwCM), and of course the help command **ganache -f --help**.
