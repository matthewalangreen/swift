//: Playground - noun: a place where people can play

import Foundation

// computes factorial correctly
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

// still working on this.
func digits(_ num: Int) -> [Int] {
    var a = [Int]() // empty int
    a.append(1)
    a.append(2)
   return a
}

// returns the number of digits for a given number
// will be used as a helper function to terminate loops in above function
func numDigits(_ num: Decimal) -> Int {
    var power = 1
    var limit = pow(10,power)

    while num > limit {
        power += 1
        limit = pow(10,power)
    }
    return limit.exponent
}

fact(5)
digits(24)
numDigits(323)


