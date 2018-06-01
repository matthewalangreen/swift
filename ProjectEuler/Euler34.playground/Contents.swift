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
    let r = numDigits(Decimal.init(num)) // cast to Decimal
    var n = num
    for i in 1...r {
        let p = Float(r-i)
        let val = Int(powf(10,p))
        a.append((n-n%val)/val)
        n = n%val
    }
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
digits(324576)
numDigits(324)
324%1000
324%100
24%10
(4-4%1)/1

