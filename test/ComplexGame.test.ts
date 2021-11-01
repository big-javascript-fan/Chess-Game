import { ethers } from "hardhat";
import { Contract } from "@ethersproject/contracts";  


describe("ComplexGame", function () { 
  let randomizerLib: Contract; 
  let simpleGame: Contract; 
  before(async function () { 
    const Randomizer = await ethers.getContractFactory("Randomizer");
    randomizerLib = await Randomizer.deploy();
 
     const ComplexGame = await ethers.getContractFactory("ComplexGame", {
      libraries: { 
        Randomizer: randomizerLib.address
        }
     });
    simpleGame = await ComplexGame.deploy();
  });

  describe("Play", () => {
    it("each 30 pieces play 10 moves", async function () {
       simpleGame.setup(30);
       simpleGame.play(10, 30);
    });
  });   
});