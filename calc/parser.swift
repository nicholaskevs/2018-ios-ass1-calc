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
    func fixPositiveNumber() {
        for i in question.indices {
            if !operators.contains(question[i]) {
                question[i] = String(Int(question[i])!)
            }
        }
    }
    
    func checkInputValidity() throws {
        // checking if there is an operator
        if question.count > 1 {
            var counter = 0
            for op in operators {
                if question.contains(op) {
                    counter += 1
                }
            }
            if counter == 0 {
                throw CalcError.invalidInput
            }
        }
        
        // checking if the numbers are valid
        for q in question {
            if !operators.contains(q) && Int(q) == nil {
                throw CalcError.invalidInput
            }
        }
        
        fixPositiveNumber()
        
        // checking question format
        if operators.contains(question.last!) {
            throw CalcError.invalidInput // last element must be a number
        }
        for i in question.indices {
            if i%2 == 0 && Int(question[i]) == nil {
                throw CalcError.invalidInput // even index element must be a number
            }
            if i%2 == 1 && !operators.contains(question[i]) {
                throw CalcError.invalidInput // odd index element must be an operator
            }
        }
    }
}
