/*:
 # Chapter Challenge: Battle Grounds
 ---
 
 ### Tasks
 1. Create a type alias called **Attack** with named values for name and damage
 2. Create a type alias called **ScoreClosure** with a integer array as parameter and no return value
 3. Write a simple function called **attackEnemy** with an integer parameter that prints out an interpolated string
 4. Write an overloaded version of **attackEnemy** with a parameter of type Attack and returns a boolean
 5. Use both **attackEnemy** methods
 6. Write a function called **fetchPlayerScores** that has a closure parameter of type ScoreClosure and use it to return an array of scores
 7. Call the **fetchPlayerScores** closure, loop through the scores and print out an interpolated string
 */
// 1
typealias Attack = (name: String, damage: Int)
// 2
typealias ScoreClosure = ([String:Int]) -> Void
// 3
func attackEnemy(value: Int) {
    print("This is a string with a number: \(value)")
}
// 4
func attackEnemy(val: Attack) -> Bool {
    print("You attack with: \(val.name) and \(val.damage) damage");
    return true
}
// 5
attackEnemy(value: 12)
var enemyWasDefeated = attackEnemy(val: ("Awesometown", 12))
// 6
func fetchPlayerScores(score: ScoreClosure) -> [Int]{
    let scores = ["First": 10, "Second": 15, "Third": 20]
    return [scores["First"]!, scores["Second"]!, scores["Third"]!]
}
//// 7
//fetchPlayerScores(score: <#T##([String : Int]) -> Void#>)
//: [Previous Topic](@previous)
