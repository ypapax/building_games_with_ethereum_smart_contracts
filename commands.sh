#!/usr/bin/env bash
set -ex

gethSync() {
  geth --syncmode fast --cache=1024
}

testNetSync() {
  geth --rinkeby --port 31303 --rpc
}

newWallet() {
  geth account new
}

newWalletTestNet() {
  geth --rinkeby account new
}

# getting ether for rinkeby network: https://faucet.rinkeby.io/
# my test account link https://rinkeby.etherscan.io/tx/0x792c0dfe7ad6f182b1cf70cb4426963f4f53eb89b9748f7b1b7d98d479861982
# transaction link https://rinkeby.etherscan.io/address/0x6822f9cc53512bcd267ea577337dbbe45e7e41b7
balance() {
  geth --rinkeby attach <<EOF
eth.getBalance(eth.accounts[$account])
EOF
}

balances() {
  geth --rinkeby --port 31303 attach <<EOF
  eth.accounts.forEach(function(ac){
    console.info("balance ", ac, " :", eth.getBalance(ac));
  });
EOF
}

accounts() {
  geth --rinkeby  attach <<EOF
eth.accounts
EOF
}

installSpecificSolcjs(){
  npm i solc@0.4.15 -g
}

account=2
password="$RINKBEBY_ACCOUNT5_PASSWORD"

buildContractManually(){
  pushd contracts
  solcjs --bin --abi -o bin HelloWorld.sol
  bytecode=$(cat bin/HelloWorld_sol_HelloWorld.bin)
  abi=$(cat bin/HelloWorld_sol_HelloWorld.abi)
  geth --rinkeby attach <<EOF
  account=$account;
  bytecode="0x$bytecode";
  password="$password";
  personal.unlockAccount(eth.accounts[account], password);
  console.info("balance ", account, " :", eth.getBalance(eth.accounts[account]));
  tx = eth.sendTransaction({ from: eth.accounts[account], data:
  bytecode, gas: 500e3 });
  address = web3.eth.getTransactionReceipt(tx).contractAddress;
  console.info("contract address", address);
  abi="$abi";
  HelloWorld = web3.eth.contract(abi).at(address);
  HelloWorld.greet();
EOF
  popd
}

truffleeInit(){
  truffle init
}
develop(){
  truffle develop
}

truffleMigrate(){
  truffle migrate -f 2
}

"$@"
