//
//  ViewController.swift
//  Project04 - SnapChat
//
//  Created by dongzhicheng on 2019/6/26.
//  Copyright © 2019 zcdong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    
    var scrollView: UIScrollView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView = UIScrollView.init()
        scrollView!.frame = view.bounds
        scrollView!.contentSize = CGSize(width: 3*screenWidth, height: screenHeight);
        scrollView!.isPagingEnabled = true
        view.addSubview(scrollView!)
        
        let leftView: UIView = UINib(nibName: "LeftView", bundle:nil).instantiate(withOwner: nil, options: nil).first as! UIView
        let centerView: UIView = CenterView()
        let rightView: UIView = Bundle.main.loadNibNamed("RightView", owner: nil, options: nil)?.first as! UIView
        
        leftView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        centerView.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightView.frame = CGRect(x: 2*screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        scrollView!.addSubview(leftView)
        scrollView!.addSubview(centerView)
        scrollView!.addSubview(rightView)
        
    }


}

