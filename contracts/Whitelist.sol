//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "hardhat/console.sol";

contract Whitelist {
    uint8 public maxNumberOfWhitelistedAddresses;
    uint8 public numberOfWhitelistedAddresses;

    mapping(address => bool) public isAddressWhitelisted;

    constructor(uint8 _maxNumberOfWhitelistedAddresses) {
        maxNumberOfWhitelistedAddresses = _maxNumberOfWhitelistedAddresses;
    }

    function whitelistAddress() public {
        require(numberOfWhitelistedAddresses < maxNumberOfWhitelistedAddresses, "No more addresses can be whitelisted");
        require(!isAddressWhitelisted[msg.sender], "this address is already whitelisted");

        isAddressWhitelisted[msg.sender] = true;

        numberOfWhitelistedAddresses += 1;
    }   

}
