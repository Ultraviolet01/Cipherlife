const { ethers } = require("hardhat");
const { expect } = require("chai");

describe("FHE Verification", function () {
  it("Should compile and deploy CipherLifeVault", async function () {
    const CipherLifeVault = await ethers.getContractFactory("CipherLifeVault");
    const vault = await CipherLifeVault.deploy();
    await vault.waitForDeployment();
    expect(await vault.getAddress()).to.be.properAddress;
  });

  it("Should compile and deploy CipherLifeAccount", async function () {
    const CipherLifeAccount = await ethers.getContractFactory("CipherLifeAccount");
    const account = await CipherLifeAccount.deploy();
    await account.waitForDeployment();
    expect(await account.getAddress()).to.be.properAddress;
  });
});
