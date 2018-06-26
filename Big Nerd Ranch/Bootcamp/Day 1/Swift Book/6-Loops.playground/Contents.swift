//: Playground - noun: a place where people can play

import Cocoa

//for i in 1...100 where i%3 == 0 {
//    print(i)
//}


// Silver challenge
for i in 1...100 {
    switch i {
    case let c where (c%3 == 0 && c%5 == 0):
        print("fizzBuzz")
    case let a where a%3 == 0:
        print("fizz")
    case let b where b%5 == 0:
        print("buzz")
    default:
        print(i)
    }
}
