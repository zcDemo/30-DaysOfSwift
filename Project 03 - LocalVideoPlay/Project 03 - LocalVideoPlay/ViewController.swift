//
//  ViewController.swift
//  Project 03 - LocalVideoPlay
//
//  Created by dongzhicheng on 2019/6/24.
//  Copyright © 2019 zcdong. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

struct Video {
    let image: String
    let title: String
    let source: String
}

class ViewController: UIViewController {
    
    var data = [
        // 给项目编译后属于同一个module，所以Video不需要import就可以使用
        Video(image: "videoScreenshot01",
              title: "Introduce 3DS Mario",
              source: "Youtube - 06:32"),
        Video(image: "videoScreenshot02",
              title: "Emoji Among Us",
              source: "Vimeo - 3:34"),
        Video(image: "videoScreenshot03",
              title: "Seals Documentary",
              source: "Vine - 00:06"),
        Video(image: "videoScreenshot04",
              title: "Adventure Time",
              source: "Youtube - 02:39"),
        Video(image: "videoScreenshot05",
              title: "Facebook HQ",
              source: "Facebook - 10:20"),
        Video(image: "videoScreenshot06",
              title: "Lijiang Lugu Lake",
              source: "Allen - 20:30")
    ]
    
    var gradientView: UIView = UIView.init()
    
    
    var playViewController = AVPlayerViewController()
    var playerView = AVPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gradientView.frame = view.bounds
        view.addSubview(gradientView);
//        
//       
//        let fillColors = [dataSet.color(atIndex: 0).cgColor, dataSet.color(atIndex: 1).cgColor, dataSet.color(atIndex: 2).cgColor]
//        let locations:[CGFloat] = [0.2, 0.6, 1.0]
//        print(barRect)
//        context.saveGState()
//        context.clip(to: barRect)
//        let gradient:CGGradient
//        let colorspace:CGColorSpace
//        colorspace = CGColorSpaceCreateDeviceRGB()
//        
//        gradient = CGGradient(colorsSpace: colorspace, colors: fillColors as CFArray, locations: locations)!
//        
//        //Vertical Gradient
//        let startPoint:CGPoint = CGPoint(x: 0.0, y: viewPortHandler.contentBottom)
//        let endPoint:CGPoint = CGPoint(x: 0.0, y: viewPortHandler.contentTop)
//        
//        context.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
//        context.restoreGState()
        
    }
    
    @objc func playButtonAction() {
        let path = Bundle.main.path(forResource: "PRED", ofType: "mp4")
        
        
        
        playerView = AVPlayer(url: URL(fileURLWithPath: path!))
        playViewController.player = playerView
        
        
        
        
        // 知识点：尾随闭包
        // 在使用尾随闭包时，你不用写出它的参数标签
        // 如果闭包表达式是函数或方法的唯一参数，则当你使用尾随闭包时，你甚至可以把 () 省略掉
        // 完整形式如下：
        //self.present(playViewController, animated: true, completion: {
        //    self.playViewController.player?.play()
        //})
        self.present(playViewController, animated: true) {
            self.playViewController.player?.play()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let model = data[indexPath.row]
        cell.bgImageView.image = UIImage(named: model.image)
        cell.videoTitleLabel.text = model.title
        cell.playButton.addTarget(self, action: #selector(playButtonAction), for: UIControl.Event.touchUpInside)
        
        return cell
    }
    
    
}

