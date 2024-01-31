pragma solidity ^0.8.22;


contract FristCoin{
    address public minter;
    mapping (address => uint) public balances;

    event sent(address from,address to, uint amount);

    modifier onlyMinter {
        require(msg.sender == minter);
        _;
    }

    constructor (){
        minter = msg.sender;
    }

    function mint(address reciver,uint amount) public onlyMinter{
        require(amount < 1e60);
        balances[reciver] += amount;
    }


    function send(address reciver,uint amount) public {
        require(amount <= balances[msg.sender],"do not enough money");
        balances[msg.sender] -= amount;
        balances[reciver] += amount;
        emit sent(msg.sender,reciver,amount);
    }
}

