pragma solidity ^8.0.22;

contract Auction{
    
    uint public auctionEndTime;

    uint public highestBid;

    address public highetBidder;

    mapping(address => uint) public pendsingReturns;

    event highestBidIncrease(address bidder,uint amount);

    function bid() public payable{
        if (block.timestamp  > auctionEndTime){
            revert("Auction Ended");
        }

        if (msg.value <= highestBid){
            revert("Aution less than highetBid");
        }

        if (highetBid != 0){
            pendingReturns[highetBidder] += highestBid;
        }

        highestBidder = msg.sender;
        highestBid = msg.value;
        emit highestBidIncrease(msg.sender,msg.value);
    }

    function withDraw() public returns(bool) {
        uint amount = pendingReturns[msg.sender];
        if (amount > 0){
            pendingReturns[msg.sender] = 0;
            if(!payable msg.sender.send(amount)){
                pendingReturns[msg.sender] = amount;
                return false;
            }
        }
        return true;
    }

    function auctionEnd() public {

    }
}