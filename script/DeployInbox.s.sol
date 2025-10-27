// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";
import {Inbox} from "../src/Inbox.sol";

contract DeployInbox is Script {
    function run() external returns (Inbox) {
        string memory initialMessage = "Hello from Foundry!";

        vm.startBroadcast();

        Inbox inbox = new Inbox(initialMessage);
        console.log("Inbox deployed at:", address(inbox));
        console.log("Initial message:", inbox.message());

        vm.stopBroadcast();

        return inbox;
    }
}
