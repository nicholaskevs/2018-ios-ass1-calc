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
    
    func solve() throws {
        while question.count > 1 {
            // multiplication, division, and modulation
            while question.contains(operators[2]) || question.contains(operators[3]) || question.contains(operators[4]) {
                for i in question.indices {
                    if question[i] == operators[2] {
                        solveMul(index: i)
                        break
                    }
                    if question[i] == operators[3] {
                        try solveDiv(index: i)
                        break
                    }
                    if question[i] == operators[4] {
                        try solveMod(index: i)
                        break
                    }
                }
            }
            
            // addition and substraction
            while question.contains(operators[0]) || question.contains(operators[1]) {
                for i in question.indices {
                    if question[i] == operators[0] {
                        solveAdd(index: i)
                        break
                    }
                    if question[i] == operators[1] {
                        solveSub(index: i)
                        break
                    }
                }
            }
        }
    }
    
    func solveAdd(index: Int) {
        let answer = Int(question[index-1])! + Int(question[index+1])!
        let temp: [String] = [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveSub(index: Int) {
        let answer = Int(question[index-1])! - Int(question[index+1])!
        let temp: [String] = [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveMul(index: Int) {
        let answer = Int(question[index-1])! * Int(question[index+1])!
        let temp: [String] = question[question.startIndex ..< index-1] + [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveDiv(index: Int) throws {
        try checkDivisionByZero(index: index)
        let answer = Int(question[index-1])! / Int(question[index+1])!
        let temp: [String] = question[question.startIndex ..< index-1] + [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveMod(index: Int) throws {
        try checkDivisionByZero(index: index)
        let answer = Int(question[index-1])! % Int(question[index+1])!
        let temp: [String] = question[question.startIndex ..< index-1] + [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func checkDivisionByZero(index: Int) throws {
        if question[index+1] == "0" {
            throw CalcError.divisionByZero
        }
    }
    
}
