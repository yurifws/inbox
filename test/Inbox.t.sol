// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {Inbox} from "../src/Inbox.sol";

contract InboxTest is Test {
    Inbox public inbox;
    string public initialMessage = "Hello World";
    
    function setUp() public {
        inbox = new Inbox(initialMessage);
    }
    
    function testInitialMessage() public {
        assertEq(inbox.message(), initialMessage);
    }
    
    function testSetMessage() public {
        string memory newMessage = "New message";
        inbox.setMessage(newMessage);
        assertEq(inbox.message(), newMessage);
    }
    
    function testSetEmptyMessage() public {
        inbox.setMessage("");
        assertEq(inbox.message(), "");
    }
    
    function testSetLongMessage() public {
        string memory longMessage = "This is a very long message that we want to store in the blockchain";
        inbox.setMessage(longMessage);
        assertEq(inbox.message(), longMessage);
    }
    
    function testMultipleSetMessages() public {
        inbox.setMessage("First");
        assertEq(inbox.message(), "First");
        
        inbox.setMessage("Second");
        assertEq(inbox.message(), "Second");
        
        inbox.setMessage("Third");
        assertEq(inbox.message(), "Third");
    }
}