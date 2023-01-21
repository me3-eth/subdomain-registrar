const GatewayBeta = require('./out/GatewayBeta.sol/GatewayBeta.json')
const NftAuthoriser = require('./out/NftAuthoriser.sol/NftAuthoriser.json')
const Registrar = require('./out/Registrar.sol/Registrar.json')

module.exports = {
  GatewayBeta: GatewayBeta.abi,
  NftAuthoriser: NftAuthoriser.abi,
  Registrar: Registrar.abi
}
