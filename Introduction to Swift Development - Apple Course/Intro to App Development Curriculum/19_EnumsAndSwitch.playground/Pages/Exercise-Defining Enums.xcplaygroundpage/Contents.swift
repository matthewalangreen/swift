/*:
 ## Exercise: Defining Enums
 
 Get some practice defining your own enums. Remember the rules about naming enums and their cases. 
 
 - callout(Exercise): Define an enum for the compass directions: North, East, South, and West.
*/
enum Suit {
    case spades, hearts, diamonds, clubs
    
    var rank: Int {
        switch self {
        case .spades: return 4
        case .hearts: return 3
        case .diamonds: return 2
        case .clubs: return 1
        }
    }
    
    var emoji: String {
        switch self {
        case .spades: return "♠"
        case .hearts: return "♥"
        case .diamonds: return "♦"
        case .clubs: return "♣"
        }
    }
    
    func beats(_ otherSuit: Suit) -> Bool {
        return self.rank > otherSuit.rank
    }
}

let oneSuit = Suit.spades
let otherSuit = Suit.clubs
oneSuit.beats(otherSuit)
oneSuit.beats(oneSuit)
oneSuit.emoji

enum CompassDirections {
    case north, south, east, west

    var val: String {
        switch self {
        case .north: return "NORTH"
        case .south: return "SOUTH"
        case .east: return "EAST"
        case .west: return "WEST"
        }
    }
}

let aThingIMade = CompassDirections.north



//: - callout(Exercise): Define an enum for jigsaw puzzle pieces: corner, edge, and middle.
enum Piece {
    case corner, edge, middle
    
    var pieceType: String {
        switch self {
        case .corner: return "CORNER"
        case .edge: return "EDGE"
        case .middle: return "MIDDLE"
        }
    }
    
    func samePieceType(_ otherPiece: Piece) -> Bool {
        return self.pieceType == otherPiece.pieceType
    }
}

var newValue = Piece.corner
var otherValue = Piece.middle
newValue.samePieceType(otherValue)

//: - callout(Excercise): Define an enum for the playback modes in a music app: standard, repeat, repeat all, and shuffle.
enum Modes {
    case standardMode, repeatMode, repeatAllMode, shuffleMode
    
    var modeType: String {
        switch self {
        case .standardMode: return "SM"
        case .repeatMode: return "RM"
        case .repeatAllMode: return "RAM"
        case .shuffleMode: return "SFM"
        }
    }
}

let newMode = Modes.repeatMode
 
 



//: [Previous](@previous)  |  page 17 of 21  |  [Next: Exercise: Counting Chickens](@next)
