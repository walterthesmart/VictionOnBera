// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {ZUBBYTOKEN} from "../src/ZUBBYTOKEN.sol";

contract ZubbyScript is Script {
    function setUp() public {}

    function run() external { 
        // uint privateKey = vm.envUnint("PRIVATE_KEY");\
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address account = vm.addr(deployerPrivateKey);
        // address secondAccount = 0x611419E8768E45d1e25A6B7d3A51403e9BEfC599;
        console.log("Account: ", account);

        vm.startBroadcast(deployerPrivateKey);
        // deploy ZUBBYTOKEN contract and mint 1000 tokens
        ZUBBYTOKEN zubbyToken = new ZUBBYTOKEN("ZubbyToken", "ZUBBY", 1000000000000000000000);
        // mint
        zubbyToken.mint(account, 1000 ether);
        console.log("contract deployed");
        //transfer
        // zubbyToken.transfer(account, secondAccount, 50);
        // console.log("transfer done");
        vm.stopBroadcast();

        // return zubbyToken;
    }
}