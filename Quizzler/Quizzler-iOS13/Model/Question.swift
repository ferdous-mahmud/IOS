//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Ferdous Mahmud Akash on 9/11/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let ans: String
    
    init(q: String, a: String) {
        question = q
        ans = a
    }
}
