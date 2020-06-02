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

// generate random array of given size
func generateRandomArray(size: Int, maxValue: UInt32) -> [Int] {
    guard size > 0 else { return [Int]() }
    var result = [Int](repeating: 0, count: size)
    for index in 0..<size {
        result[index] = Int.random(in: 0...Int(maxValue))
        result[index] = Int(arc4random_uniform(maxValue))
    }
    return result
}

// sums up the numbers frome the input array
func sum(array: [Int]) -> Int {
    var result = 0
    for index in 0..<array.count {
        result += array[index]
    }
    return result
}

let array100 = generateRandomArray(size: 100, maxValue: UInt32.max)
var executionTime = BenchTimer.measureBlock {
    _ = sum(array: array100)
}
print("Average sum() execution time for \(array100.count) elements: \(executionTime)")

let array1000 = generateRandomArray(size: 1000, maxValue: UInt32.max)
executionTime = BenchTimer.measureBlock {
    _ = sum(array: array1000)
}
print("Average sum() execution time for \(array1000.count) elements: \(executionTime)")

let array10000 = generateRandomArray(size: 10000, maxValue: UInt32.max)
executionTime = BenchTimer.measureBlock {
    _ = sum(array: array10000)
}
print("Average sum() execution time for \(array10000.count) elements: \(executionTime)")
