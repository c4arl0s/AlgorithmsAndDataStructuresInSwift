import UIKit

func badSum(number: Int) -> Int {
    print(number)
    return number + badSum(number: (number-1))
}

let result = badSum(number: 3)
print(result)


