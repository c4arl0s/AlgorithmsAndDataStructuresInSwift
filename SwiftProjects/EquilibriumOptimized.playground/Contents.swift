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

func equilibriumOptimized(_ numbers: [Int]) -> [Int]? {
    var indices = [Int]()
    var leftSum = 0
    var sum = numbers.reduce(0, +)
    let count = numbers.count
    for index in 0..<count {
        sum = sum - numbers[index]
        if leftSum == sum {
            indices.append(index)
        }
        leftSum = leftSum + numbers[index]
    }
    return indices.isEmpty ? nil : indices
}

let testedArray = [-3, 2, -2, 1, -2, 2, 1, 3, 2, 1, 2, 3, 1, 3, 2, 5, 2, 6, 0, 1, 5, -3, 2, -2, 1, -2, 2, 1, 3, 2, 1, 2, 3, 1, 3, 2, 5, 2, 6, 0, 1, 5]

var executionTime = BenchTimer.measureBlock {
    _ = equilibriumOptimized(testedArray)
}

print("Average equilibriumOptimized() execution time for array with \(testedArray.count) elements is \(executionTime.formattedTime)")

