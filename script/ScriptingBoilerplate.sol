// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.8.15;

import {Script, console2 as console} from "forge-std/Script.sol";
import {Test} from "forge-std/Test.sol";

contract ScriptingBoilerplate is Script, Test {
    // Anvil's 8th unlocked account
    uint256 public constant ATTACKER_PK = 0xdbda1821b80551c9d65939329250298aa3472ba22feea921c0cf5d620ea67b97;
    address public constant ATTACKER = 0x23618e81E3f5cdF7f54C3d65f7FBc0aBf5B21E8f;

    // Anvil's 9th unlocked account
    uint256 public constant DEPLOYER_PK = 0x2a871d0798f97d79848a013d4936a73bf4cc922c825d33c1cf7073dff6d409c6;
    address public constant DEPLOYER = 0xa0Ee7A142d267C1f36714E4a8F75612F20a79720;

    constructor() {
        vm.label(DEPLOYER, "DEPLOYER");
        vm.label(ATTACKER, "ATTACKER");
    }
}
