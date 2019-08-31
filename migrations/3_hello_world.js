var HelloWorld = artifacts.require("./HelloWorld.sol");
// and then you can call it in develop console by:
// HelloWorld.deployed().then(h => h.greet());
module.exports = function (deployer, network) {
    // unlock account for geth
    if (network === "rinkeby" || network === "mainnet") {
        const accountNumber = 2;
        const password = process.env.RINKBEBY_ACCOUNT5_PASSWORD;
        web3.personal.unlockAccount(web3.eth.accounts[accountNumber], password)
    }
    console.info("network", network);
    deployer.deploy(HelloWorld);
};