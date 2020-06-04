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

let smallDictionary = ["one": 1, "two": 2, "three": 3]
var executionTime = BenchTimer.measureBlock {
    _ = smallDictionary["two"]
}
print("Average lookup time in a dictionary with \(smallDictionary.count) elments: \(executionTime.formattedTime)")

func generatesDictionaries(size: Int) -> Dictionary<String,Int> {
    var result = Dictionary<String,Int>()
    guard  size > 0 else { return result }
    for index in 0..<size {
        let key = String(index)
        result[key] = index
    }
    return result
}

let mediumDictionary = generatesDictionaries(size: 500)
executionTime = BenchTimer.measureBlock {
    _ = mediumDictionary["324"]
}
print("Average lookup time in a dictionary with \(mediumDictionary.count) elements: \(executionTime.formattedTime)")

let hugeDictionary = generatesDictionaries(size: 100000)
executionTime = BenchTimer.measureBlock {
    _ = hugeDictionary["55555"]
}
print("Average lookup time in a dictionary with \(hugeDictionary.count) elements: \(executionTime.formattedTime)")

