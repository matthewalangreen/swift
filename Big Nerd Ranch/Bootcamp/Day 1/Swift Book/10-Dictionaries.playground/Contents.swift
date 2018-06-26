//: Playground - noun: a place where people can play

import Cocoa

var movieRatings = ["Donnie Darko": 4, "Chunking Express": 5, "Dark City": 4]
//print(movieRatings)
////print("I have rated \(movieRatings.count) movies")
//let darkoRating = movieRatings["Donnie Darko"]
//movieRatings["Dark City"] = 5
//movieRatings

// note: updateValue() method returns the old value as an optional
//let oldRating: Int? = movieRatings.updateValue(5, forKey: "Donnie Darko")
//if let lastRating = oldRating, let currentRating = movieRatings["Donnie Darko"] {
//    print("Old rating: \(lastRating); current rating: \(currentRating)")
//}

for (key,value) in movieRatings {
    print("The movie \(key) was rated \(value)")
}

let watchedMovies = Array(movieRatings.keys)
print(watchedMovies)

//Silver Challenge
var waCounties:[String:[Int]] = [:]// make a dicitonary of String ->
waCounties["first"] = [1,2,3,4,5]
waCounties["Second"] = [11,22,33,44,55]
waCounties["third"] = [111,222,333,444,555]
let zips = Array(waCounties.values.joined()) // joined puts in linear array
print("Wa has the following zip codes: \(zips)")

// gold challenge


