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

func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else { return false }
    return array.first == 0 ? true : false
}

var verySmallArray = [1,0,0]
var executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: verySmallArray)
}

print("Average startsWithZero() execution time for array with \(verySmallArray.count) elements is \(executionTime)")

var mediumArray = Array<Int>(repeating: 0, count: 1000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: mediumArray)
}

print("Average startsWithZero() execution time for array with \(mediumArray.count) elements is \(executionTime)")

var hugeArray = Array<Int>(repeating: 0, count: 1000000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: hugeArray)
}

print("Average startsWithZero() execution time for array with \(hugeArray.count) elements is \(executionTime)")
