pragma solidity ^0.5.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/TheContract.sol";

contract TestTheContract{
	
	TheContract tc;

	constructor() public{}

	function beforeAll() public
	{
		tc = TheContract(DeployedAddresses.TheContract());
		Assert.equal(tc.thenumber(), 50, "The initial number should be 50");
	}

	function testModifierFails() public
	{
		uint _anumber = tc.maximum() + 10;
		(bool success, ) = address(tc).call(
			abi.encodeWithSignature("storeNumber(uint256)", _anumber));

		Assert.isFalse(
			success, 
			"The call should fail (the number is too large).");

		Assert.equal( tc.thenumber(), 50, "The number should not have changed.");
	}

	function testModifierSucceeds() public
	{
		uint _anumber = tc.maximum() - 10;
		(bool success, ) = address(tc).call(
			abi.encodeWithSignature("storeNumber(uint256)", _anumber));

		Assert.isTrue(
			success, 
			"The call should suceeded (the number is smaller than maximum).");

		Assert.equal( 
			tc.thenumber(), _anumber, 
			"The number should have changed.");
	}
}
 