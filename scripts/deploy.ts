import { ethers } from "hardhat";

async function main() {

  const SimpleGame = await ethers.getContractFactory("SimpleGame");
  const simpleGame = await SimpleGame.deploy();
  console.log("SimpleGame Contract is deployed to:", simpleGame);

  // console.log('Upgrading SimpleGame...');
  // await SimpleGame.upgradeProxy('0x9fE46736679d2D9a65F0992F2272dE9f3c7fa6e0', SimpleGame);
  // console.log('SimpleGame upgraded');

  const ComplexGame = await ethers.getContractFactory("ComplexGame");
  const complexGame = await ComplexGame.deploy();
  console.log("ComplexGame Contract is deployed to:", complexGame);

}
 
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
