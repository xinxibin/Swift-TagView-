//
//  GMTagTableViewCell.swift
//  TagViewTagLab
//
//  Created by Xinxibin on 16/10/20.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

let ScreenWidth = UIScreen.main.bounds.size.width

class GMTagTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func createTagCell(direction:Int) ->FMTagTableViewCell{
        
        let cell = Bundle.main.loadNibNamed("FMTagTableViewCell", owner: nil, options: [:])?.last as? FMTagTableViewCell
        cell?.frame = CGRect(x: 0, y: 0, width: 100, height: 23)
        cell?.updateUI(direction: direction)
        return cell!
    }
    
    // 设置数据
    func setImgData(imgStr:String ,tagModel:FMHomeGoodsModel) {
        
        imageCover.image = UIImage(named: imgStr)
        removeSubviewsToTagView()

        if !isHaveTagView() {
            // 创建标签
            let tagCell = createTagCell(direction: tagModel.direction)
            tagCell.tagIndex = 0
            tagCell.delegate = self
            self.addSubview(tagCell)
            tagCell.setTagViewFrame(tagModel: tagModel, tagCell: tagCell, cell: self)
        }
    }
    
    // 防止复用清楚之前的标签view
    func removeSubviewsToTagView() {
        let tagCellArr = self.subviews
        for item in tagCellArr {
            
            if item is FMTagTableViewCell{
                item.removeFromSuperview()
            }
        }
    }

    /**
     cell的子视图是否包含 TagTableViewCell
     
     - returns: true 有 false 无
     */
    func isHaveTagView() ->Bool {
        
        let viewArr =  self.subviews
        for item in viewArr {
            if item is  FMTagTableViewCell{
                return true
            }
            return false
        }
        return false
    }

}

extension GMTagTableViewCell:FMTagTableViewCellDelegate {
    
    func tapTextTagClick(index: Int) {
        print("tapTextTagClick")
    }
    
}


