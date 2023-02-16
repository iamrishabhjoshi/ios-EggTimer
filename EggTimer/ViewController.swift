//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let softTime=5
    let mediumTime=7
    let hardTime=12
    let eggTimes=["Soft": 5,"Medium": 7,"Hard": 12]
   
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func hardnessSelected(_ sender: UIButton) {
        progressBar.progress = 1.0
        timer.invalidate()
        let hardness=sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
       
        progressBar.progress=0.0
        secondsPassed=0
        titleLabel.text=hardness
            
           timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        }

    
    @objc func updateTimer() {
            if(secondsPassed < totalTime)
        {
                secondsPassed += 1
                let percentageProgress = Float(secondsPassed)/Float(totalTime)
                progressBar.progress = Float(percentageProgress)
             
            }
        else{
            timer.invalidate()
            titleLabel.text = "Done!"
        }
}
}
