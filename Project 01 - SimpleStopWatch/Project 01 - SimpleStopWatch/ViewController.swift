//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by dongzhicheng on 2019/6/19.
//  Copyright © 2019 zcdong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var numberLabel: UILabel!
    
    var counter: Float = 0.0 {
        didSet {
            print(counter)
            numberLabel.text = String(format: "%.1f", counter)
        }
    }
    
    var timer: Timer? = Timer()
    var isPlay = false {
        didSet {
            if isPlay {
                playButton.isEnabled = false
                pauseButton.isEnabled = true
            } else {
                playButton.isEnabled = true
                pauseButton.isEnabled = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0.0;
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats:true)
        isPlay = true
    }
    
    @IBAction func pauseButtonAction(_ sender: UIButton) {
        isPlay = false
        self.stopTime()
    }
    
    @IBAction func resetButtonAction(_ sender: Any) {
        isPlay = false;
        counter = 0.0
        self.stopTime()
    }
    
    func stopTime() {
        timer?.invalidate()
        timer = nil;
    }
    
    @objc func updateTime() {
        print("-----")
        counter += 0.1;
    }
}

