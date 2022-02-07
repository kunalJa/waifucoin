require('dotenv').config()
require("@nomiclabs/hardhat-waffle");

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.11",
  networks: {
    rinkeby: {
      url: `${process.env.ALCHEMY_API_URL}`,
      accounts: [`${process.env.PRIVATE_KEY}`]
    }
  }
};
