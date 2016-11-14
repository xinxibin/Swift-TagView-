//
//  ViewController.swift
//  TagViewTagLab
//
//  Created by Xinxibin on 16/10/20.
//  Copyright © 2016年 Xinxibin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var bgView:GMTagView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.updateTableView), name: NSNotification.Name(rawValue: ApplicationWillEnterForeground), object: nil)

        
        bgView = Bundle.main.loadNibNamed("GMTagView", owner: nil, options: nil)?.first as? GMTagView
        bgView?.frame = self.view.frame
        self.view.addSubview(bgView!)
        
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func updateTableView() {
        bgView.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

