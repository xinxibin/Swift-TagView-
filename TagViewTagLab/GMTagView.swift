//
//  GMTagView.swift
//  TagViewTagLab
//
//  Created by Xinxibin on 16/10/20.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

class GMTagView: UIView {

    @IBOutlet weak var tableView: UITableView!
    
    var imageData:[String] = []
    var tagModels:[FMHomeGoodsModel] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        loadImageData()
        loadTagData()
        addSubViews()
    }
    
    func loadImageData() {
        
        for index in 0..<9 {
            var imgStr = ".jpeg"
            imgStr = "\((index + 1))"  + imgStr
            imageData.append(imgStr)
        }
    }
    
    func loadTagData() {
        
        let nameArr = ["洁白的云","白色的心","浩瀚的银河","闪亮的星星","美丽的沙滩","七彩的地平线","炫彩的晚霞","黑洞","很多的文字"]
        
        
        for index in 0..<9 {
            let model = FMHomeGoodsModel()
            if index == 0 {
                model.direction = -1
                model.posx = 0.5
                model.posy = 0.5
            }else {
                model.direction = 1
                model.posx = 0.5
                model.posy = 0.5
            }
            
            
            model.goods_name = nameArr[index]
            tagModels.append(model)
        }
        
    }
    
    func addSubViews() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "GMTagTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.tableFooterView = UIView()

    }

}

extension GMTagView:UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 2 * UIScreen.main.bounds.size.width / 3
    }

}

extension GMTagView:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GMTagTableViewCell
        cell.selectionStyle = .none
        cell.setImgData(imgStr:imageData[indexPath.row],tagModel:tagModels[indexPath.row])
        
        return cell
    }
    
}
