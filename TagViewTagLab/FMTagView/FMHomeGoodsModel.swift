//
//  FMHomeGoodsModel.swift
//  fengmi
//
//  Created by Xinxibin on 16/8/29.
//  Copyright © 2016年 BAOFENG. All rights reserved.
//

import UIKit

class FMHomeGoodsModel: NSObject {

    /*
     为商品单独添加的字段
     goods_name 　	商品名称
     goods_desc 　	商品描述
     goods_price 　	商品价格
     goods_link	商品链接
     goods_cover	商品图片
     posx	打点位置在x轴距原点百分比
     posy	打点位置在y轴距原点百分比
     
     */
    var goods_name = ""
    var goods_price = ""
    var goods_link = ""
    var goods_cover = ""
    var posx:CGFloat = 0
    var posy:CGFloat = 0
    var direction = 1

}
