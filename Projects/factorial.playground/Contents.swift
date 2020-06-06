import UIKit

func factorial(number: UInt64) -> UInt64 {
   return number < 2 ? 1 : number * factorial(number: number-1)
}

let factorialNumber = factorial(number: 20)
print(factorialNumber)
