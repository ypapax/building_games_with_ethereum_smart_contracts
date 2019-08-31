HelloWorld = artifacts.require('HelloWorld');
module.exports = function () {
    const instance = HelloWorld.at(HelloWorld.address);
    instance.then(i => i.greet().then(console.log));
}