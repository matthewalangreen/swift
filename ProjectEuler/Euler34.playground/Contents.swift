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

// Example -- digits(324)
// n = 324
// i = 1
// (324 - 324%100)/100  => (324 - 24)/100  =>  300/100 => 3  => Save that digit in list a => [3]
// (24 - 24%10)/10  => (24 - 4)/10  =>  20/10  => 2 => add that digit to list a => [3,2]
// (4 - 4%1)/1 => (4 - 0)/1 => 4 => add that digit to list a => [3,2,4]
func digits(_ num: Int) -> [Int] {
    var a = [Int]() // empty int
    let r = numDigits(Decimal.init(num)) // convert input to decimal for use in helper function
    var n = num // create a holder so we can update its value in loop
    for i in 1...r {
        // calculate the power of 10 needed to do help decompose value
        let val = Int(powf(10,Float(r-i)))
        // add this first digit to the list of digits
        a.append((n-n%val)/val)
        // find next seed
        n = n%val
    }
   return a
}

// returns the number of digits for a given number
// will be used as a helper function to terminate loops in above function
func numDigits(_ num: Decimal) -> Int {
    var power = 1
    var limit = pow(10,power)

    // Example
    // num = 324
    // limit = 10
    // First Loop
    //   power = 2
    //   limit = 100
    // Second Loop
    //   power = 3
    //   limit = 1000
    // END
    // return power
    while num > limit {
        power += 1
        limit = pow(10,power)
    }
    return power
}

fact(5)
digits(324)
numDigits(324)
324%1000
324%100
24%10
(4-4%1)/1

