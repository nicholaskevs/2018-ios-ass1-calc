//
//  parser.swift
//  calc
//
//  Created by Nicholas on 30/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

class Parser {
    let operators: [String] = ["+", "-", "x", "/", "%"]
    var question: [String]
    
    init(question: [String]) {
        self.question = question
    }
    
    // remove + sign infront of positive number e.g. +42 -> 42
    func parse() {
        for i in question.indices {
            if !operators.contains(question[i]) {
                question[i] = String(Int(question[i])!)
            }
        }
    }
    
    func checkInputValidity() -> Bool {
        // checking if there is an operator
        if question.count > 1 {
            var counter = 0
            for op in operators {
                if question.contains(op) {
                    counter += 1
                }
            }
            if counter == 0 {
                return false
            }
        }
        
        parse()
        
        // checking if the numbers are valid
        for q in question {
            if !operators.contains(q) && Int(q) == nil {
                return false
            }
        }
        
        // checking question format
        if operators.contains(question.last!) {
            return false // last element must be a number
        }
        for i in question.indices {
            if i%2 == 0 && Int(question[i])==nil {
                return false // even index element must be a number
            }
            if i%2 == 1 && !operators.contains(question[i]) {
                return false // odd index element must be an operator
            }
        }
        
        return true
    }
}
