HelloWorld = artifacts.require('HelloWorld');
module.exports = function () {
    // const instance = HelloWorld.at(HelloWorld.address);
    // instance.greet().then(console.log);
    HelloWorld.deployed().then(h => console.info(h.greet().then(r => console.info("result", r)))).catch(function (e) {
        console.error(e);
    });
    // HelloWorld.deployed().then(function (instance) {
    //     console.info("instance.greet()", instance.greet());
    // });
}