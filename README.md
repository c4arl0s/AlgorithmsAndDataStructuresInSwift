# Algorithms And Data Structures In Swift

1. [Introduction]()
	* [Why you should learn algorithms]()
2. [The Big-O Notation]()
	* [Constant Time Complexity]()
	* [Linear Time Complexity]()
	* [Quadratic Time Complexity]()
	* [Hints of polinomial Time Complexity]()
	* [Logarithmic Time]()
	* [Summary]()
3. [Recursion]()
	* [What is recursion?]()
	* [How Does Recursion Work?]()
4. [The Power of Algorithms]()
	* [Calculate Sum(n)]()
	* [Pair Matching Challenge]()
	* [Find the Equilibrium Index]()
	* [Summary]()
5. [Generics]()
	* [Why Generics?]()
	* [Generic Types]()
	* [Generic Functions]()
6. [The Build-In Swift collection Types]()
	* [The Array]()
	* [Accessing the Array]()
	* [Modifying the Array]()
	* [The Set]()
	* [Accesing and Modifying the Set]()
	* [Set Operations]()
	* [The Hashable Protocol]()
	* [The Dictionary]()
	* [Creating Dictionaries]()
	* [Heterogeneous Dictionaries]()
	* [Accesing & Modifying the contents of a Dictionary]()
7. [Basic Sorting]()
	* [Selection Sort]()
	* [Insertion Sort]()
	* [Bubble Sort]()
8. [Advance Sorting]()
	* [The merge sort]()
	* [QuickSort]()


1. [Recursion]()

# 3. Recursion

Is a way to solve a reocurring problem repeatedly solving similar subproblems

```swift
// a function calls itself
func r() {
    r()
}
```

or indirectly

```swift
// a function call it from another function
func r() {
    g()
}

func g() {
    r()
}
```

### A linked list can be described as a list node followed by a linked list.

```swift
class Node {
    var next: Node?
    var value: String
    
    init(value: String) {
        self.value = value
    }
}

let node1 = Node(value: "value of nodo1")
let node2 = Node(value: "value of nodo2")
let node3 = Node(value: "value of nodo3")

node1.next = node2
node2.next = node3
node3.next = nil

func parseNodes(from node: Node?) {
    guard let validNode = node else { return }
    print(validNode.value)
    parseNodes(from: validNode.next)
}

parseNodes(from: node1)
```


```console
value of nodo1
value of nodo2
value of nodo3
```

### Recursion won't necessarily produce faster or more efficient code.
### It usually provides an elegant alternative to iterate approaches and requires fewer lines of code.

# How does recursion work ? 

 n! = 1 x 2 x 3 x ... x n
 
 ```swift
 func factorial(number: UInt64) -> UInt64 {
    return number < 2 ? 1 : number * factorial(number: n-1)
 }
 ```


# [Algorithms And Data Structures In Swift](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)

# 1. [Introduction](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Why you should learn algorithms](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 2. [The Big-O Notation](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Constant Time Complexity](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Linear Time Complexity](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Quadratic Time Complexity](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Hints of polinomial Time Complexity](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Logarithmic Time](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Summary](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 3. [Recursion](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [What is recursion?](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [How Does Recursion Work?](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 4. [The Power of Algorithms](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Calculate Sum(n)](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Pair Matching Challenge](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Find the Equilibrium Index](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Summary](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 5. [Generics](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Why Generics?](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Generic Types](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Generic Functions](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 6. [The Build-In Swift collection Types](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [The Array](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Accessing the Array](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Modifying the Array](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [The Set](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Accesing and Modifying the Set](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Set Operations](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [The Hashable Protocol](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [The Dictionary](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Creating Dictionaries](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Heterogeneous Dictionaries](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Accesing & Modifying the contents of a Dictionary](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 7. [Basic Sorting](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Selection Sort](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Insertion Sort](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [Bubble Sort](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 8. [Advance Sorting]()
# 	* [The merge sort](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
# 	* [QuickSort](https://github.com/c4arl0s/AlgorithmsAndDataStructuresInSwift#algorithms-and-data-structures-in-swift)
 
