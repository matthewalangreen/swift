//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
errorCodeString = "404"
if errorCodeString != nil { // check if exists
    let theError = errorCodeString! // force unwrap
    print(theError)
}

// do this with Optional Binding... way cleaner, yo
if let theError = errorCodeString {
    print(theError)
}

// Silver Challenge
//let annie: String? = nil
//print(annie!)

