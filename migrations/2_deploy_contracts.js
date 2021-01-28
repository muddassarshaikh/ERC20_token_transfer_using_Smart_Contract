const SampleToken = artifacts.require('SampleToken');
const ERC20TokenTransfer = artifacts.require('ERC20TokenTransfer');

module.exports = function (deployer) {
  deployer.deploy(SampleToken);
  deployer.deploy(ERC20TokenTransfer);
};
