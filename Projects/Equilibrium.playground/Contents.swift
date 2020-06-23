import UIKit

func equilibrium(_ numbers: [Int]) -> [Int]? {
    guard numbers.count > 0 else { return nil }
    var indices = [Int]()
    var left = 0
    var right = 0
    let count = numbers.count
    for index in 0..<count {
        left = 0
        right = 0
        for j in 0..<index {
            left = left + numbers[j]
        }
        for j in index+1..<count {
            right = right + numbers[j]
        }
        if left == right {
            indices.append(index)
        }
    }
    return indices.isEmpty ? nil : indices
}
