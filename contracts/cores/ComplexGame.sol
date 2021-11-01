//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "../interfaces/IGame.sol";
import "../libraries/KnightMove.sol";
import "../libraries/SystemTypes.sol";
import "../libraries/Randomizer.sol"; 
import "../libraries/console.sol"; 
// import "hardhat/console.sol";


contract ComplexGame {
   
    SystemTypes.Position private position;

    function play(uint256 _moves, uint256 _pieces) external { 
         // todo: Put your code here.
        for (uint j = 0; j < _pieces; j++) {
            KnightMove knight = new KnightMove();
            SystemTypes.Position memory currentPosition = position; 
            console.log("0: My Position is (%d,%d)", currentPosition.X, currentPosition.Y);
            for (uint i = 0; i < _moves; i++) {
                SystemTypes.Position[] memory possibles = knight.validMovesFor(currentPosition);
                uint r = Randomizer.random(possibles.length) % possibles.length; 
                currentPosition = possibles[r]; 
                console.log("%d: My Position is (%d,%d)", i, currentPosition.X, currentPosition.Y); 
            }
        }
    }
    
    function setup(uint256 _pieces) external {
        for (uint j = 0; j < _pieces; j++) {
            if (j < 8) {
                position = SystemTypes.Position(j,1);
            } else if (j > 7 && j < 16) {
                position = SystemTypes.Position((j - 8), 2);
            } else if (j > 15 && j < 24) {
                position = SystemTypes.Position((j - 16), 3);
            } else if (j > 23 && j < 32) {
                position = SystemTypes.Position((j - 24), 4);
            }
        }

    }
} 