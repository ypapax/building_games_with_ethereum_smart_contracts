#!/usr/bin/env bash
set -ex


gethSync(){
  geth --syncmode fast --cache=1024
}

testNetSync(){
  geth --rinkeby --port 31303
}

newWallet(){
  geth account new
}

newWalletTestNet(){
  geth --rinkeby account new
}

# getting ether for rinkeby network: https://faucet.rinkeby.io/
balance(){
  geth --rinkeby attach << EOF
eth.getBalance(eth.accounts[2])
EOF
}

accounts(){
  geth --rinkeby attach << EOF
eth.accounts
EOF
}

"$@"