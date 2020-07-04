import Foundation
import QuartzCore

public class BenchTimer {
    public static func measureBlock(closure:() -> Void) -> CFTimeInterval {
        let runCount = 10
        var executionTimes = Array<Double>(repeating: 0.0, count: runCount)
        for index in 0..<runCount {
            let startTime = CACurrentMediaTime()
            closure()
            let endTime = CACurrentMediaTime()
            let executionTime = endTime - startTime
            executionTimes[index] = executionTime
        }
        return (executionTimes.reduce(0, +)) / Double(runCount)
    }
}

public extension CFTimeInterval {
    var formattedTime: String {
        return self >= 1000 ? String(Int(self)) + "s" : self >= 1 ? String(format: "%.3gs", self) : self >= 1e-3 ? String(format: "%.3gms", self * 1e3) : self >= 1e-6 ? String(format: "%.3gus", self * 1e6) : self < 1e-9 ? "0s" : String(format: "%.3gns", self * 1e9)
    }
}

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

let testedArray = [-3, 2, -2, 1, -2, 2, 1, 3, 2, 1, 2, 3, 1, 3, 2, 5, 2, 6, 0, 1, 5, -3, 2, -2, 1, -2, 2, 1, 3, 2, 1, 2, 3, 1, 3, 2, 5, 2, 6, 0, 1, 5]

var executionTime = BenchTimer.measureBlock {
    _ = equilibrium(testedArray)
}

print("Average equilibrium() execution time for array with \(testedArray.count) elements is \(executionTime.formattedTime)")
