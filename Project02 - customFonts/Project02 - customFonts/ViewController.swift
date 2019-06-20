//
//  ViewController.swift
//  Project02 - customFonts
//
//  Created by dongzhicheng on 2019/6/20.
//  Copyright © 2019 zcdong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let dataSource = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                     "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                     "呵呵，再见🤗 See you next Project",
                     "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    let fontNames =  ["MFTongXin_Noncommercial-Regular",
                      "MFJinHei_Noncommercial-Regular",
                      "MFZhiHei_Noncommercial-Regular",
                      "Zapfino",
                      "Gaspar Regular"]
    
    var fontNumber = 0
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UITableViewCell, forCellReuseIdentifier: "cell")
        tableView.register(UINib.init(nibName: "Cell", bundle: .main), forCellReuseIdentifier: "cell")
    }

    @IBAction func changeFontButtonAction(_ sender: Any) {
        if fontNumber < 4 {
            fontNumber += 1
        } else {
            fontNumber = 0
        }        
        tableView.reloadData()
    }
    
    //MARK: tableView dataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.textColor = UIColor.white
        cell.textLabel?.font = UIFont.init(name: fontNames[fontNumber], size: 14)
        cell.textLabel?.text = dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40;
    }
    
    //MARK: tableView delegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView(tableView, didDeselectRowAt: indexPath)
        
    }
    
}

