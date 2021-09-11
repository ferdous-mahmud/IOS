//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Ferdous Mahmud Akash on 9/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quize = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia"),
        Question(q: "What is the capital of Bangladesh?", a: ["Dhaka", "New Dellhi", "Bankok"], correctAnswer: "Dhaka")

    ]
    
    var questionNumber = 0
    var score = 0
    
    // Function for Score
    func getScore() -> Int{
        return score
    }
    
    
    // Function for Question Text
    func getQuestionText() -> String{
        return quize[questionNumber].question
    }
    
    // Function for ans Titel
    func getAnsTitel(position: Int) -> String{
        return quize[questionNumber].ans[position]
    }
    
    // Function for progress Bar
    func getProgress() -> Float{
        return Float(questionNumber + 1) / Float(quize.capacity)
    }
    
    // Function For check Answer
    mutating func checkAnswer(_ userTappedAns: String) -> Bool {
        if(quize[questionNumber].correctAnswer == userTappedAns){
            score += 1
            return true
        }
        else{
            return false
        }
    }
    
    // Function for hava question
    mutating func haveQuestion(){
        if(questionNumber + 1 == quize.capacity){
            questionNumber = 0
            score = 0
        }
        else{
            questionNumber += 1
        }
    }
}
