//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

enum CalcError: Error {
    case invalidInput
    case divisionByZero
}

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

do {
    let parser = Parser(question: args)
    try parser.checkInputValidity()
    
    let solver = Solver(question: parser.question)
    try solver.solve()
    
    // print the solution
    print(solver.question[0])

} catch CalcError.invalidInput {
    print("Error: Invalid input.")
    exit(1)
} catch CalcError.divisionByZero {
    print("Error: Division by zero.")
    exit(2)
}

