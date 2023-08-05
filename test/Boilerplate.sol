// SPDX-License-Identifier: MIT

pragma solidity ^0.8.15;

import {Test, stdStorage, StdStorage, console2 as console} from "forge-std/Test.sol";

contract Boilerplate is Test {
    using stdStorage for StdStorage;

    address public ATTACKER;
    address public DEPLOYER;
    address public ADMIN;
    address public ALICE;
    address public BOB;
    address public CHARLIE;
    address public EVE;

    bool public activePrank;

    // Forking
    string internal mainnet = vm.envString("MAINNET_RPC_URL");
    // Mainnet forked by anvil, this way we can reduce calls to Alchemy
    string internal localhost = vm.envString("LOCALHOST_RPC_URL");

    function initializeBoilerplate() public {
        makeAddr();
    }

    ////////////////////////////////////////////////////////////////////
    //                           Utilities                            //
    ////////////////////////////////////////////////////////////////////

    function suStart(address user) public {
        vm.startPrank(user);
        activePrank = true;
    }

    function suStop() public {
        vm.stopPrank();
        activePrank = false;
    }

    modifier asUser(address user) {
        suStart(user);
        _;
        suStop();
    }

    function makeAddr() public {
        ATTACKER = address(0x1337);
        vm.label(ATTACKER, "ATTACKER");
        DEPLOYER = address(0xDEADBEEF);
        vm.label(DEPLOYER, "DEPLOYER");
        ADMIN = address(0xCAFE);
        vm.label(ADMIN, "ADMIN");
        ALICE = address(0x1111);
        vm.label(ALICE, "ALICE");
        BOB = address(0x2222);
        vm.label(BOB, "BOB");
        CHARLIE = address(0x3333);
        vm.label(CHARLIE, "CHARLIE");
        EVE = address(0x4444);
        vm.label(EVE, "EVE");
        vm.label(address(this), "TEST CONTRACT");
    }

    function readSlot(address target, bytes4 selector) public returns (bytes32) {
        uint256 slot = stdstore.target(target).sig(selector).find();
        return vm.load(target, bytes32(slot));
    }
}
