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

//generates multiplication tables
func multiplicationTable(size: Int) -> [Int] {
    var table = [Int]()
    let array = [Int](1...size)
    for outsideIndex in 0..<array.count {
        for insideIndex in 0..<array.count {
            let value = array[outsideIndex]*array[insideIndex]
            table.append(value)
        }
    }
    return table
}

let sizes = [10, 20, 30]

for index in 0..<sizes.count {
    let size = sizes[index]
    let executionTime = BenchTimer.measureBlock {
        _ = multiplicationTable(size: size)
    }
    print("Average multiplicationTable() execution time for \(size) elements is \(executionTime.formattedTime)")
}


