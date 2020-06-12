func badSum(number: Int) -> Int {

    if number==0 {
        return 0
    }
    return number + badSum(number: (number-1))
}
let result = badSum(number: -1)
print(result)



