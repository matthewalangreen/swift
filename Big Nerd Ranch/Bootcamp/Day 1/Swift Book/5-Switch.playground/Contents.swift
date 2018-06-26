//: Playground - noun: a place where people can play

import Cocoa


// Bronze challenge
let point = (x: 1, y: 4)
switch point {
case _ where point.x > 0 && point.y > 0:
    print("first case")
case let q2 where point.x < 0 && point.y > 0:
    print("this is the second case")
default:
    print("what happened?")
}


