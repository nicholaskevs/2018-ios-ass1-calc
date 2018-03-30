//
//  solver.swift
//  calc
//
//  Created by Nicholas on 30/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

class Solver {
    let operators: [String] = ["+", "-", "x", "/", "%"]
    var question: [String]
    
    init(question: [String]) {
        self.question = question
    }
}
