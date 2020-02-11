# Algorithms And Data Structures In Swift

1. [Introduction]()
2. [The Big-O Notation]()
3. [Recursion]()
4. [The Power of Algorithms]()
5. [Generics]()
6. [The Build-In Swift collection Types]()
7. [Basic Sorting]()
8. [Advance Sorting]()


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

