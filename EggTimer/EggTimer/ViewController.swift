//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

var player: AVAudioPlayer!

class ViewController: UIViewController {
    
    let eggTimer = ["Soft": 300, "Medium": 420, "Hard": 720]
    var totalTime  = 0
    var secondPassed = 0
    var timer = Timer()
    
    @IBOutlet weak var showPercentage: UITextField!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeRemaining: UIProgressView!
    
    @IBAction func hardnessSelector(_ sender: UIButton) {
        
        // Invalid previous timer
        timer.invalidate()
        
        // Set eggTimer value on totalTime
        totalTime = eggTimer[sender.currentTitle!]!
        
        // Display what value selected
        titleLabel.text = sender.currentTitle
        
        // Time counting ...
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter() {
       //example functionality
       if totalTime >= secondPassed {
        timeRemaining.progress = Float(secondPassed) / Float(totalTime)
        //Show progress in percentage
        let percentage = timeRemaining.progress * 100
        showPercentage.text = ("\(Int(percentage)) %")
        secondPassed += 1
       }
       else {
        timer.invalidate()
        titleLabel.text = "Done!"
        
        // Playing alarm sound
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
       }
   }
     
}
