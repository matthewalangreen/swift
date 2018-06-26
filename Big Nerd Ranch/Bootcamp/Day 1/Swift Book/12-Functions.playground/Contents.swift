//: Playground - noun: a place where people can play

import Cocoa

func printGreeting() {
    print("Hello, playground.")
}

//printGreeting()

// Bronze Challenge
func greetByMiddleName(fromFullName name: (first: String, middle: String?, last: String)) {
    guard let middleName = name.middle, middleName.count > 4 else {
        print("Hey there!")
        return
    }
    print("hey \(middleName)")
}
//greetByMiddleName(fromFullName: ("Matt","Danger","Mathias"))



// Silver Challenge

func siftBeans(fromGroceryList list: [String]) -> (beans: [String], otherGroceries: [String]){
    var beans: [String] = []
    var other: [String] = []
    for item in list {
        if item.hasSuffix("beans") {
            beans.append(item)
        } else {
            other.append(item)
        }
    }
    return (beans, other)
}

let result = siftBeans(fromGroceryList: ["green beans", "milk", "black beans", "pinto beans", "apples"])

print(result)
