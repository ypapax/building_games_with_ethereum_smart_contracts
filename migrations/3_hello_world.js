var HelloWorld = artifacts.require("./HelloWorld.sol");
// and then you can call it in develop console by:
// HelloWorld.deployed().then(h => h.greet());
module.exports = function (deployer) {
    deployer.deploy(HelloWorld);
};