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
    
    func solve() {
        while question.count > 1 {
            while question.contains(operators[2]) {
                solveMul(index: question.index(of: operators[2])!)
            }
            while question.contains(operators[3]) {
                solveDiv(index: question.index(of: operators[3])!)
            }
            while question.contains(operators[4]) {
                solveMod(index: question.index(of: operators[4])!)
            }
            while question.contains(operators[0]) {
                solveAdd(index: question.index(of: operators[0])!)
            }
            while question.contains(operators[1]) {
                solveSub(index: question.index(of: operators[1])!)
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
        let temp: [String] = [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveDiv(index: Int) {
        let answer = Int(question[index-1])! / Int(question[index+1])!
        let temp: [String] = [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
    func solveMod(index: Int) {
        let answer = Int(question[index-1])! % Int(question[index+1])!
        let temp: [String] = [String(answer)] + question[index+2 ..< question.endIndex]
        question = temp
    }
    
}
