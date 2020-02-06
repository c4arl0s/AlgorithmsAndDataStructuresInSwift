# AlgorithmsAndDataStructuresInSwift
AlgorithmsAndDataStructuresInSwift

# Recursividad

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

