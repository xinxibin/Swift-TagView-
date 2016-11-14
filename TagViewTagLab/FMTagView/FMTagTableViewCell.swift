//
//  FMTagTableViewCell.swift
//  testTagImage
//
//  Created by Xinxibin on 16/9/4.
//  Copyright © 2016年 GloryMan. All rights reserved.
//

import UIKit

protocol FMTagTableViewCellDelegate {
    func tapTextTagClick(index:Int)
}

class FMTagTableViewCell: UITableViewCell {

    // 标签在又相关控件
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var tagImageView: FMTagImageView!
    @IBOutlet weak var rightTextTagBgView: UIView!
    @IBOutlet weak var rightBtnBlackBgView: UIView!
    
    // 标签在左相关控件
    @IBOutlet weak var leftTagBtn: UIButton!
    @IBOutlet weak var tagRightImageView: FMTagImageView!
    @IBOutlet weak var leftTextTagBgView: UIView!
    @IBOutlet weak var leftBtnBlackBgView: UIView!
    
    var delegate:FMTagTableViewCellDelegate?
    var tagIndex = 0
    var imgStr = ""
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        rightBtnBlackBgView.layer.cornerRadius  = 23/2
        leftBtnBlackBgView.layer.cornerRadius   = 23/2
        rightBtnBlackBgView.layer.masksToBounds = true
        leftBtnBlackBgView.layer.masksToBounds  = true
    }
    
    func updateUI(direction:Int) {
        
        if direction == 1 {
            imgStr = "KK_Filter_btn_black"
            self.leftTextTagBgView.isHidden = true
            self.tagRightImageView.isHidden = true
            
            self.tagImageView.isHidden       = false
            self.rightTextTagBgView.isHidden = false
            
            rightBtnBlackBgView.isHidden     = false
            leftBtnBlackBgView.isHidden      = true
        } else {
            imgStr = "KK_Filter_btn_black_left"
            
            self.leftTextTagBgView.isHidden = false
            self.tagRightImageView.isHidden = false
            
            self.tagImageView.isHidden       = true
            self.rightTextTagBgView.isHidden = true
            
            rightBtnBlackBgView.isHidden     = true
            leftBtnBlackBgView.isHidden      = false
        }
        
        // 图片拉伸中间
        let image = UIImage(named: imgStr)
        let top = image!.size.height * 0.5
        let left = (image?.size.width)! * 0.5
        let bottom = image!.size.height * 0.5
        let right = (image?.size.width)! * 0.5
        let edge = UIEdgeInsetsMake(top, left, bottom, right)
        let mode = UIImageResizingMode.stretch
        let newImage = image?.resizableImage(withCapInsets: edge, resizingMode: mode)
        print("\(newImage)")

    }
    
    func setTagViewFrame(tagModel:FMHomeGoodsModel,tagCell:FMTagTableViewCell,cell:GMTagTableViewCell) {
        
        let str = tagModel.goods_name
        let attributes = [NSFontAttributeName :UIFont.systemFont(ofSize: 12)]
        let labelSize = str.boundingRect(with: CGSize(width: 200, height: 1000), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        
        tagCell.frame = CGRect(x: 0, y: 0, width: labelSize.width + 20 + 15, height: 23)
        tagCell.center = CGPoint(x: 10.0, y: 1.0)
        // 处理方向
        if tagModel.direction == 1 {
            // 标签在右侧
            tagCell.btn.setTitle(str, for: UIControlState.normal)
            tagImageView.startTagAnimation()
            let tagCellWidth = tagCell.bounds.size.width/2 - 23/2
            tagCell.center = CGPoint(x: (ScreenWidth) * tagModel.posx + tagCellWidth, y: cell.frame.size.height * tagModel.posy)
        }else{
            // 标签在左侧
            tagCell.leftTagBtn.setTitle(tagModel.goods_name, for: UIControlState.normal)
            tagRightImageView.startTagAnimation()
            let tagCellWidth = tagCell.bounds.size.width/2
            tagCell.center = CGPoint(x: ((ScreenWidth) * tagModel.posx) - tagCellWidth + 23/2, y: cell.frame.size.height * tagModel.posy )
        }
        
    }
    
    
    @IBAction func onTextTagClick(sender: AnyObject) {
        
        delegate?.tapTextTagClick(index: tagIndex)
    }

    @IBOutlet weak var onLeftTextTagClick: UIButton!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
