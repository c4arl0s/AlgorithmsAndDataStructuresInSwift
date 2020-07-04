func findTwoSum(_ array: [Int], target: Int) -> [(Int, Int)]? {
    guard array.count > 1 else { return nil }
    var tupleArray = [(Int, Int)]()
    for leftIndex in 0..<array.count {

        let left = array[leftIndex]
        for rightIndex in (leftIndex+1)..<array.count {
            let right = array[rightIndex]
            if left+right == target {
                tupleArray.append((leftIndex, rightIndex))
            }
        }
    }
    return tupleArray
}

let testedArray = [1, 2, 2, 3, 4]
let result = findTwoSum(testedArray, target: 4)
print(result!)

func findTwoSumOptimized(_ testedArray: [Int], target: Int) -> [(Int, Int)]? {
    guard testedArray.count > 1 else { return nil }
    var tupleArray = [(Int, Int)]()
    var diffs = Dictionary<Int,Int>()
    for leftIndex in 0..<testedArray.count {
        let left = testedArray[leftIndex]
        let right = target-left
        if let foundIndex = diffs[right] {
            tupleArray.append((foundIndex, leftIndex))
        } else {
            diffs[left] = leftIndex
        }
    }
return tupleArray
}

let optimizedResult = findTwoSumOptimized(testedArray, target: 4)
print(optimizedResult!)
