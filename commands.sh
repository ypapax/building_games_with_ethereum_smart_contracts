#!/usr/bin/env bash
set -ex

gethSync() {
  geth --syncmode fast --cache=1024
}

testNetSync() {
  geth --rinkeby --port 31303
}

newWallet() {
  geth account new
}

newWalletTestNet() {
  geth --rinkeby account new
}

# getting ether for rinkeby network: https://faucet.rinkeby.io/
# my transaction link https://rinkeby.etherscan.io/address/0x6822f9cc53512bcd267ea577337dbbe45e7e41b7
balance() {
  geth --rinkeby attach <<EOF
eth.getBalance(eth.accounts[2])
EOF
}

balances() {
  geth --rinkeby attach <<EOF
  eth.accounts.forEach(function(ac){
    console.info("balance ", ac, " :", eth.getBalance(ac));
  });
EOF
}

accounts() {
  geth --rinkeby attach <<EOF
eth.accounts
EOF
}

"$@"
