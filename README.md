# Swift-TagView-

标签视图，支持左右控制，附带雷达动画

# 先上一张图

![](http://oahmyhzk1.bkt.clouddn.com/image/gif/TagView.gif)

# 实现原理

* 自定义一个UIImageView 实现雷达动画和添加中间的小黄点。
* 自定义一个tableViewCell 使用xib，添加一个 UIimageView 在添加一个用于显示标题的lab
* 同理添加一个相反方向的
* 根据方向展示对应的作标签还是右标签

# 代码实现

* 需要一个数据模型demo中的（FMHomeGoodsModel）
* 在需要的地方直接创建FMTagTableViewCell
* 在cell中处理方向和标题赋值


# 喜欢请给star

# 更多关于iOS-Swift动画请关注

[我的博客地址](xinxibin.com)