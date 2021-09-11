//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // Change button color when answer selected
        if(quizBrain.checkAnswer(sender.currentTitle!)){
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        
        // 0.2 seconds delay for showing color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.updateUI()
        }
        
        // Have question or not
        quizBrain.haveQuestion()
        
    }
    
    func updateUI(){
        
        // Set question text
        questionLable.text = quizBrain.getQuestionText()
        
        // Clear background color
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        // Progress Bar update
        progressBar.progress = quizBrain.getProgress()
        
    }
    
}

