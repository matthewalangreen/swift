//: Playground - noun: a place where people can play

import Foundation

func fact(_ x: Int) -> Int {
    if x <= 0 { return -1 }
    var sum: Int = 1
    var i = x
    while i > 0 {
        sum *= i
        i -= 1
    }
    return sum
}

func digits(_ num: Int) -> [Int] {
    var a = [Int]() // empty int
    a.append(1)
    a.append(2)
   return a
}

func numDigits(_ num: Decimal) -> Decimal {
    var power = 1
    var limit = pow(10,power) as Int
    
    while num < limit {
        power += 1
        limit = pow(10,power)
    }
    return limit as Int
}

fact(5)
digits(10)
numDigits(200)


