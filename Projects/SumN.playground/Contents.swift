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

func sum(_ number: UInt) -> UInt {
    var result: UInt = 0
    for index in 1...number {
        result += index
    }
    return result
}

let step = 100
var executionTime: Double

for index in 1...10 {
    executionTime = BenchTimer.measureBlock {
        _ = sum(UInt(index*step))
    }
    print("Average sum(n) execution time fo \(index*step) elements: \(executionTime.formattedTime)")
}

func sumOptimized(_ number: UInt) -> UInt{
    return number * (number + 1) / 2
}

for index in 1...10 {
    executionTime = BenchTimer.measureBlock {
        _ = sumOptimized(UInt(index*step))
    }
    print("Average sum(n) execution time fo \(index*step) elements: \(executionTime.formattedTime)")
}

