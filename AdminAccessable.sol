pragma solidity ^0.8.0; 
contract adminOnly{

    uint a;
    uint b;
    uint c;
    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyAdmin { 
        require (owner == msg.sender, "only admin can access");
        _;
    }

    function add (uint _a, uint _b) public onlyAdmin reyurn(uint){
        a = _a;
        b = _b;
        c = a+b;

        return(c);
    }

    function get() public view onlyAdmin returns(uint){
        if (a > b){
            return(a);
        }
        else {
            return(b);
        }
    }
}
