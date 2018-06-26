//: Playground - noun: a place where people can play

import Cocoa

enum ProgrammingLanguage: String {
    case swift          = "swift"
    case objectiveC     = "objective-c"
    case c              = "c"
    case cpp            = "c++"
    case java           = "java"
}

//let myFavoriteLanguage = ProgrammingLanguage.swift
//print("My favorite programming language is \(myFavoriteLanguage.rawValue)")
//

// Methods
//enum Lightbulb {
//    case on
//    case off
//
//    func surfaceTemperature(forAmbientTemperature ambient: Double) -> Double {
//        switch self {
//        case .on:
//            return ambient + 150
//        case .off:
//            return ambient
//        }
//    }
//
//   mutating func toggle() {
//        switch self {
//        case .on:
//            self = .off
//        case .off:
//            self = .on
//        }
//    }
//}
//
//let me: Lightbulb = .on
//print(me.surfaceTemperature(forAmbientTemperature: 20))



// Associated Values
enum ShapeDimensions {
    // a point has no assocaiated value -- it is dimsensionless
    case point
    
    // square's associated value is the length of one side
    case square(side: Double)
    
    // rectangle's associated valued defines its width and height
    case rectangle(width: Double, height: Double)
    
    func area() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: s):
            return s * s
        case let .rectangle(width: w, height: h):
            return w * h
        }
    }
    
    func perimeter() -> Double {
        switch self {
        case .point:
            return 0
        case let .square(side: s):
            return 4 * s
        case let .rectangle(width: w, height: h):
            return 2 * w + 2 * h
        }
    }
}

var squareShape = ShapeDimensions.square(side: 10.0)
var rectangleShape = ShapeDimensions.rectangle(width: 5.0, height: 10.0)
squareShape.area()

// Bronze challenge
squareShape.perimeter()


// Silver challenge


