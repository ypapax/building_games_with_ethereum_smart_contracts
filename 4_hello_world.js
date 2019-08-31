HelloWorld = artifacts.require('HelloWorld');
module.exports = function () {
    // const instance = HelloWorld.at(HelloWorld.address);
    // instance.greet().then(console.log);
    HelloWorld.deployed().then(h => h.greet());
    // HelloWorld.deployed().then(function (instance) {
    //     console.info("instance.greet()", instance.greet());
    // });
}