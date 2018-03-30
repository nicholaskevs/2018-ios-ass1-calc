//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

let parser = Parser(question: args)

guard parser.checkInputValidity() else {
    print("Invalid input.")
    exit(1)
}

//parser.parse()
let solver = Solver(question: parser.question)

print(parser.question[0])
