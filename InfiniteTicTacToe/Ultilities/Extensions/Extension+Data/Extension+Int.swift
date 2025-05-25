
import Foundation

extension Int {
    // Default
    static let one = 1
    static let two = 2
    static let three = 3
    static let four = 4
    static let five = 5
    static let six = 6
    static let seven = 7
    static let eight = 8
    static let nine = 9
    static let ten = 10

    // Custom
    static let twelve = 12
    static let fourteen = 14
    static let sixteen = 16
    static let eighteen = 18
    static let twenty = 20
    static let twentyFour = 24
    static let thirtyTwo = 32
    static let thirtySix = 36
    static let fortyEight = 48
    static let fifty = 50
    static let sixty = 60
    static let hundred = 100
    static let hundredThirty = 130
    static let hundredSixty = 160
    static let twoHundred = 200
    static let twoHundredForty = 240
    static let thousand = 1000

    func toCGFloat() -> CGFloat {
        return CGFloat(self)
    }
}
