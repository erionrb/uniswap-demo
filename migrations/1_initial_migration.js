require('dotenv').config();

const SKIP_ALL = process.env.SKIP_ALL;
const Migrations = artifacts.require("Migrations");

module.exports = function (deployer) {

  if(SKIP_ALL) return;

  deployer.deploy(Migrations);
};
