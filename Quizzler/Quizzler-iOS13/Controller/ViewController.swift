//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreCount: UILabel!
    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    // Multiple questin option
    @IBOutlet weak var firstOption: UIButton!
    @IBOutlet weak var secondOption: UIButton!
    @IBOutlet weak var thirdOption: UIButton!
    
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
        
        // Score
        scoreCount.text = "Score : \(quizBrain.getScore())"
        // Set question text
        questionLable.text = quizBrain.getQuestionText()
        
        // Change Option Title
        firstOption.setTitle("\(quizBrain.getAnsTitel(position: 0))", for: .normal)
        secondOption.setTitle("\(quizBrain.getAnsTitel(position: 1))", for: .normal)
        thirdOption.setTitle("\(quizBrain.getAnsTitel(position: 2))", for: .normal)
        
        // Clear background color
        firstOption.backgroundColor = UIColor.clear
        secondOption.backgroundColor = UIColor.clear
        thirdOption.backgroundColor = UIColor.clear
        
        // Progress Bar update
        progressBar.progress = quizBrain.getProgress()
        
    }
    
}

