import UIKit

func badSum(number: Int) -> Int {
    print(number)
    return number + badSum(number: (number-1))
}

badSum(number: 3)
