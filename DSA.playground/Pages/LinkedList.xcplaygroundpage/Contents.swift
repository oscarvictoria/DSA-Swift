import UIKit

var str = "Hello, playground"

// Implimenting a Node Structure

class Node<T: Equatable>: Equatable {
    var value: T
    var next: Node? // Singly linked list
    // var previous: Node? // Doubly linked list
    
    // requared function for equatable
    static func ==(lhs: Node, rhs: Node)-> Bool {
        return lhs.value == rhs.value && lhs.next == rhs.next
    }
    
    init(value: T) {
        self.value = value
    }
}

// Impimenting CustomStringConvertible to custustemize description

extension Node: CustomStringConvertible {
    var description: String {
        guard let next  = next else {
            return "\(value) -> nil"
        }
        return "\(value) -> \(next)"
    }
}


// Instantiating node instances
let cart12 = Node<Int>(value: 12)
let cart99 = Node<Int>(value: 99)
let cart199 = Node<Int>(value: 199)


// Link our nodes


cart12.next = cart99
cart99.next = cart199

// In order to print our connected nodes in a readable manner we conformed to CustomStringConvertible

print(cart12.description)

// What we just built is a node class.


// imlementation of a linked list

class LinkedList<T: Equatable> {
    var head: Node<T>?
    var tail: Node<T>?
    
    
    // first computed property
    public var first: Node<T>? {
        return head
    }
    
    public var isEmpty: Bool {
    print("empty list")
     return head == nil

    }
    
    // last computed property
    public var last: Node<T>? {
        return tail
    }
    
    // append method
    
    public func append(_ value: T) {
        let newNode = Node(value: value)
    
        
        guard let lastNode = tail else {
            head = newNode
            tail = head
            return
        }
        
        // Scenearia 2:
        lastNode.next = newNode
        tail = newNode
    }
    
    
    // removeLast method
    public func removeLast()-> Node<T>? {
        if isEmpty {
            return nil
        }
        
        var removedNode: Node<T>?
        if head == tail {
            removedNode = head
            head = nil
            tail = nil
            return removedNode
        }
        // Scenario 3 - iterate, transverse, walk the linked list starting from the head
        
        var currentNode = head
        while currentNode?.next  != tail { // stop at node before the tail
            // keep traversing
            currentNode = currentNode?.next
        }
        // where is currentNode at the end of the while loop
        
        // saved the tails node before removing the last node (tail)
        removedNode = tail
        
        // set tail to node before the last node
        tail =  currentNode
        
        currentNode?.next = nil
        return removedNode
    }
    

    
}

extension LinkedList: CustomStringConvertible {
    var description: String {
        guard let head = head else {
            return "empty list"
        }
        return "\(head)"
    }
}

let fellows = LinkedList<String>()

fellows.append("Oscar")
//fellows.append("Tanya")
//fellows.append("David")

print(fellows)

fellows.removeLast()

print(fellows)
fellows.append("Luba")
print(fellows)
fellows.append("Oscar")
fellows.append("David")
print(fellows)
fellows.removeLast()
print(fellows)

fellows.removeLast()
fellows.removeLast()

let values = LinkedList<Int>()

values.append(1)
values.append(2)
values.append(3)
values.append(9)
values.append(4)
values.append(7)
values.append(12)

print(values)

func getMax(_ list: LinkedList<Int>) -> Int{
    let list = list
    var largestValue = 0
    
    while list.head != nil {
        if list.head!.value > largestValue {
            largestValue = list.head!.value
        }
        list.head = list.head?.next
    }
    
    
    
    return largestValue
}

print(getMax(values))

