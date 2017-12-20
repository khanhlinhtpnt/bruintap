//
//  ViewController.swift
//  BruinTap
//
//  Created by Linh Huynh on 12/20/17.
//  Copyright © 2017 Linh Huynh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var score = 0
    
    var timer: Timer!
    var time: Double = 10
    var bScore = 0


    @IBOutlet var startButton: UIButton!
    @IBOutlet var tapButton: UIButton!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var best: UILabel!
    
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        score = 0
        time = 10
        
        scoreLabel.text = String(score)
        timeLabel.text = String(format: "%.2f", time)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        tapButton.isEnabled = true
    }
    
    @IBAction func tappedTapButton(_ sender: UIButton) {
        score += 1
        scoreLabel.text = String(score)
        
    }
    
    @objc func timerAction() {
        
        time -= 0.01
        timeLabel.text = String(format: "%.2f", time)
        
        if time <= 0 {
            
            timer.invalidate()
            timeLabel.text = "0.00"
            
            startButton.isEnabled = true
            tapButton.isEnabled = false

            if (score > bScore){
                bScore = score
                best.text = String(score)
            }
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tapButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

