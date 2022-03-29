### 思路
-- 这个项目的设想是来源于etherscan提供了对于nft展示功能和聊天功能，这里只需要加一个担保人的角色就能完成交易。
我的想法用一个智能合约来充当担保人的角色。
具体实现：
  1，买卖双方通过自行线下沟通确定好交易的价格
  2，买家创建一笔购买订单，附带与卖家商量好的eth数量，这时候eth被转入到智能合约中，成功后买家会得到一个订单号
  3，卖家拿到订单号后，选择是否要把nft出售给买家，这里可以加一个小费功能（设想中交易不收取手续费，也没有版税，所以小费是项目唯一的收入来源）
  4，如果卖家迟迟没有选择出售，那么买家可以随时取消这个购买订单



#### rinkeby 测试网信息

-- 测试nft
  1,bayc  0xF0F6D910c1DC0208550F8Be8ab10A8988ffDfaC0
  2,doodles 0x3Bfb10b71f33de192F913AbB474E00829fA86c7e