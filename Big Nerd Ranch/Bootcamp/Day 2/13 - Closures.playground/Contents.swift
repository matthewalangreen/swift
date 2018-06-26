//: Playground - noun: a place where people can play

import Cocoa

//let volunteerCounts = [1,3,40,32,2,53,77,13]
//// this is before we condense it to become anonymous
//func isAscending(_ i: Int, _ j: Int) -> Bool {
//    return i<j
//}
//
//let volunteersSorted = volunteerCounts.sorted(by: isAscending)
//print(volunteersSorted)
//
//// first intermediate step, now anonymous
//let otherSorted = volunteerCounts.sorted(by: {
//    (i: Int, j: Int) -> Bool in
//    return i<j
//})
//print(otherSorted)
//
//// second step, to minimize code
//let anotherSort = volunteerCounts.sorted(by: {i,j in i<j})
//print(anotherSort)
//
//// simpliest form
//let lastSort = volunteerCounts.sorted(by: { $0 < $1 })
//print(lastSort)
//
//// nope, this is simplest form
//let actualLastSort = volunteerCounts.sorted { $0 < $1 }
//print(actualLastSort)

// updated to have default formatter: { $0.description }
func format(numbers: [Double], using formatter: (Double)->String = {$0.description}) -> [String] {
    var result = [String]()
    for number in numbers {
        let transformed = formatter(number)
        result.append(transformed)
    }
    return result
}

var numberOfTransformations = 0
let rounder: (Double) -> String = {
    (num: Double) -> String in
    numberOfTransformations += 1
    return Int(num.rounded()).description
}

let volunteerAverages = [10.75, 4.2, 1.5, 12.12, 16.815]
print(volunteerAverages)
let descriptions = format(numbers: volunteerAverages)
let roundedDescriptionsAsStrings = format(numbers: volunteerAverages, using: rounder)
//print(format(numbers: volunteerAverages, using: rounder))
//print(numberOfTransformations)

// using map(_:)
let otherAverages = volunteerAverages.map( {
    (avg: Double) -> Int in
    return Int(avg.rounded())
})
//print(otherAverages)

// using filter(_:)
let passingAverages = volunteerAverages.filter {
    (pass: Double) -> Bool in
    return pass >= 10
}
print(passingAverages)

// using map(_:) and filter(_:) in succession!
let twoTransforms = volunteerAverages
    .filter { (item: Double) -> Bool in return item >= 10}
    .map { (item: Double) -> Int in return Int(item.rounded())}

print(twoTransforms)

// using reduce(_:_:)
let estimatedParticipation = passingAverages.reduce(5) {
    (estimationSoFar: Double, currentOrgAverage: Double) -> Double in
    return estimationSoFar + currentOrgAverage
}

print(estimatedParticipation)

// Bronze challenge

