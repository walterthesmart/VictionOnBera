// SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {VICBERA} from "../src/VicOnBera.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {VICBERAScript} from "./VicOnBera.s.sol";
import {Script, console} from "forge-std/Script.sol";

contract MintVBERA is Script{
    function run() external {
        address mostRecentlyDeployedContract = DevOpsTools.get_most_recent_deployment("VICBERA", block.chainid);
        mintNftContract(mostRecentlyDeployedContract);
    }

    function mintNftContract(address contractAddress) public {
        vm.startBroadcast();
        VICBERA(contractAddress).mint(msg.sender, 90000 ether);
        vm.stopBroadcast();
    }
}
