/*
Note: The code given below isn't syntactically correct until the dependencies are installed using foundry. This is just an example for the reader to 
follow while writing their own stateful/stateless fuzz tests.
*/
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {Test} from "../blablabla";
import {StdInvariant} from "../blablabla";

// Writing stateless fuzz tests.
contract StatelessFuzzTest is Test{
  function setUp(){
    //Code to set up the Contract.
  }

  function testFuzzCatchesBugs(uint256 randomNumber) public view returns(bool) {
    // Do the Assertion. 
  }
}

// Writing stateful fuzz tests.
/*
The method given below is one way of doing stateful fuzzing and it fails in specific use cases because the random parameters for functions are useless in
most cases.   
}
*/
contract StatefulFuzzTest is StdInvariant,Test{
  StatelessFuzzTest statelessFuzzTest = new StatelessFuzzTest();
  function setUp(){
    //Code to set up the Contract.
    targetContract(address(statelessFuzzTest));
  }

  function statefulFuzz_catchesBugs() public view returns(bool) {
    // Do the Assertion. 
  }
}

/*
The second method to write Stateful Fuzz tests is given below and it will be written with the help of handlers.
*/

// We will have two files (handler.t.sol and invariant.t.sol
// Handler.t.sol

import {Contract} from "../blablabla";
contract Handler is Test {
  Contract contract;
  address user;
  construct(Contract _contract, address _user){
    contract = _contract;
    user = _user;
    // Set other stuff if required as well...
  }
}
