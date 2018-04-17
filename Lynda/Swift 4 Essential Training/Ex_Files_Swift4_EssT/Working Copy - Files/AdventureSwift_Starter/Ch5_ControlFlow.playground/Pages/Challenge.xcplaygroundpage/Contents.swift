/*:
 # Chapter Challenge: Game Conditions
 ---
 ### Tasks
 1. Create an optional called **currentWeapon** and assign it a string value
 2. Use optional binding to access **currentWeapon**
 3. Creat a variable called **currentEXP** and assign it an integer value
 4. Use a `switch` statement with **currentEXP** to evaluate different cases
 5. Create a dictionary called **playerLevels** and assign it some key-value pairs of type string and integer
 6. Use a `for-in` loop to iterate over **playerLevels** and print out its key-value pairs in an interpolated string
 7. Add a guard statement inside the `for-in` loop to mamke sure each player is at least level 1 to proceed
 */
// 1
var currentWeapon: String? = "A really big sword"
// 2
if let weapon = currentWeapon {
    print("I'm holding a \(weapon)")
} else {
    print("Oh. Noes.")
}
// 3
var currentEXP = 5
// 4
switch currentEXP {
case 0...5:
    print("You aren't great")
case 5...8:
    print("getting better")
default:
    print("the bestest!")
}
// 5
let playerLevel = ["First" : 1, "Second" : 2, "Third" : 3]
// 6
for (player, level) in playerLevel.reversed() {
    guard level > 1 else {
        print ("you can't handle the truth!")
        continue
    }
    print("Player: \(player) Level: \(level)")
}
// 7

//: [Previous Topic](@previous)
