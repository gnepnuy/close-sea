// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import './ReentrancyGuard.sol';
import './Counters.sol';
import './IERC721.sol';
import './Context.sol';

/**

这个项目的设想是来源于etherscan提供了对于nft展示功能和聊天功能，这里只需要加一个担保人的角色就能完成交易。
我的想法用一个智能合约来充当担保人的角色。
具体实现：
  1，买卖双方通过自行线下沟通确定好交易的价格
  2，买家创建一笔购买订单，附带与卖家商量好的eth数量，这时候eth被转入到智能合约中，成功后买家会得到一个订单号
  3，卖家拿到订单号后，选择是否要把nft出售给买家，这里可以加一个小费功能（设想中交易不收取手续费，也没有版税，所以小费是项目唯一的收入来源）
  4，如果卖家迟迟没有选择出售，那么买家可以随时取消这个购买订单
 */
contract CloseSea is ReentrancyGuard,Context{



  using Counters for Counters.Counter;

  Counters.Counter orderIds;


  enum Status{
    open,
    close
  }

  enum Direction{
    sell,
    buy
  }

  struct Order {
      uint256 id;
      address nft;
      uint256 tokenId;
      uint256 price;
      address otherside;
      Direction direction;
      Status status;
  }

  constructor(){

    
  }

  /**
    卖方创建订单
    列出要卖的nft和价格
    也可以限定买家
   */
  function offerForSale(address _nft,uint256 _tokenId,uint256 _price,address _buyer) external nonReentrant{
    //检验approve
    
    address approvedAddress = IERC721(_nft).getApproved(_tokenId);
    bool isOperator = IERC721(_nft).isApprovedForAll(_msgSender(), address(this));
    require(approvedAddress == address(this) || isOperator,'not allowed');
    //生成订单id
    uint256 _id = orderIds.current();
    //创建订单
    Order memory order =  Order({
      id: _id,
      nft: _nft,
      tokenId: _tokenId,
      price: _price,
      otherside: _buyer,
      direction: Direction.buy,
      status: Status.open
    });
    //event log
  }



  function cancelOrder(uint256 orderId) public {
    
  }

  function makeDeal(uint256 orderId) public{

  }
}

