pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Adoption.sol";

contract TestAdoption {
	Adoption adoption = Adoption(DeployedAddresses.Adoption());

	function testUserCanAdoptPet() {
		uint returnedId = adoption.adopt(8);
		uint expected = 8;

		Assert.equal(returnedId, expected, "ADOPTION OF PET ID 8 SHOULD BE RECORDED (test1)");
	}

	function testGetAdopterAddressByPetId() {
		address expected = this; // gets expected from testUserCanAdopt...
		address adopter = adoption.adopters(8);

		Assert.equal(adopter, expected, "OWNER OF PET ID 8 SHOULD BE RECORDED (test2)");
	}


	function testGetAdopterAddressByPetIdInArray() {
		address expected = this;

		address[16] memory adopters = adoption.getAdopters();

		Assert.equal(adopters[8], expected, "OWNER OF PET ID 8 SHOULD BE RECORDED (test3)");
	}
}
