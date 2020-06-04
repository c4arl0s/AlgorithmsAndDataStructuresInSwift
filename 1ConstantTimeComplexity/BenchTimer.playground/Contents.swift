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

func startsWithZero(array: [Int]) -> Bool {
    guard array.count != 0 else { return false }
    return array.first == 0 ? true : false
}

var verySmallArray = [1,0,0]
var executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: verySmallArray)
}

print("Average startsWithZero() execution time for array with \(verySmallArray.count) elements is \(executionTime.formattedTime)")

var mediumArray = Array<Int>(repeating: 0, count: 1000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: mediumArray)
}

print("Average startsWithZero() execution time for array with \(mediumArray.count) elements is \(executionTime.formattedTime)")

var hugeArray = Array<Int>(repeating: 0, count: 1000000)
executionTime = BenchTimer.measureBlock {
    _ = startsWithZero(array: hugeArray)
}

print("Average startsWithZero() execution time for array with \(hugeArray.count) elements is \(executionTime.formattedTime)")
