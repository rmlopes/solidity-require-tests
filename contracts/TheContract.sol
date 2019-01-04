pragma solidity ^0.5.0;

contract TheContract {
    address private owner;
    /* Simple storage function. Only stores numbers smaller than maximum. */
    uint public thenumber;
    uint public constant maximum = 100;
    
    modifier lessThanMaximum(uint _anumber)
    { 
        require(_anumber < maximum, 
                "The number provided is larger than the maximum");
        _;
    }

    constructor() public 
    {
        owner = msg.sender;
        thenumber = 50; 
    }

    function storeNumber(uint _anumber)
        public
        lessThanMaximum(_anumber)
    {
        thenumber = _anumber;
    }
}
