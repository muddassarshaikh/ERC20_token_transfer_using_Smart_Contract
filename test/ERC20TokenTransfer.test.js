const ERC20TokenTransfer = artifacts.require('ERC20TokenTransfer');
const SampleToken = artifacts.require('SampleToken');
require('chai').use(require('chai-as-promised')).should();

function tokens(n) {
  return web3.utils.toWei(n, 'ether');
}

contract('ERC20TokenTransfer', async (accounts) => {
  let sampleToken;
  let erc20TokenTransfer;

  before(async () => {
    // Load Contracts
    sampleToken = await SampleToken.new();
    erc20TokenTransfer = await ERC20TokenTransfer.new();
  });

  describe('Checking Transfer of ERC20 token from one address to another using smart contract', async () => {
    it('Transfer Token', async () => {
      await sampleToken.approve(erc20TokenTransfer.address, tokens('100'), {
        from: accounts[0],
      });

      const name = await erc20TokenTransfer.transferTokens(
        sampleToken.address,
        accounts[1],
        tokens('99'),
        { from: accounts[0] }
      );

      const balance = await sampleToken.balanceOf(accounts[1]);
      assert.equal(balance, tokens('99'));
    });
  });
});
