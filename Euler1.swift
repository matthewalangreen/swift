//
//  Euler1.swift
//  
//
//  Created by Matthew Green on 3/14/18.
//

import Foundation
//: Playground - noun: a place where people can play

//If we list all the natural numbers below 10 that are multiples of 3
// or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
//
//Find the sum of all the multiples of 3 or 5 below 1000.
var sum = 0
for i in 1..<1000 {
    if i % 3 == 0 {
        sum += i
        //print(i)
    }
    if i % 5 == 0 {
        sum += i
    }
    if i % 15 == 0 {
        sum -= i
    }
}
print(sum)


