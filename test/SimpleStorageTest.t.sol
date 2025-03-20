// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import {DeploySimpleStorage} from "../script/DeploySimpleStorage.s.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";
import {Test} from "forge-std/Test.sol";

contract SimpleStorageTest is Test {
    SimpleStorage public simpleStorage;

    function setUp() external {
        DeploySimpleStorage deployer = new DeploySimpleStorage();
        simpleStorage = deployer.run();
    }

    function testStoreNumber() public {
        // Arrange
        uint256 expectedFavoiteNumber = 777;
        // Act
        simpleStorage.store(expectedFavoiteNumber);
        // Assert
        assert(expectedFavoiteNumber == simpleStorage.retrieve());
    }

    
}
