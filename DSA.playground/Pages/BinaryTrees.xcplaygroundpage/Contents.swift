import UIKit

//class BinaryTreeNode<T> {
//    var value: T
//    var leftChild: BinaryTreeNode?
//    var rightChild: BinaryTreeNode?
//    init(_ value: T) {
//        self.value = value
//    }
//}
//
//struct Queue<T> {
//    private var elements = [T]()
//
//    public var isEmpty: Bool {
//        return elements.isEmpty
//    }
//
//    public var count: Int {
//        return elements.count
//    }
//
//    public var peek: T? {
//        return elements.first
//    }
//
//    public mutating func enqueue(_ item: T) {
//        elements.append(item)
//    }
//
//    public mutating func dequeu() -> T? {
//        guard !elements.isEmpty else { return nil}
//        return elements.removeFirst()
//    }
//}
//
//extension BinaryTreeNode {
//    func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
//        var queue = Queue<BinaryTreeNode>()
//        visit(self)
//
//        queue.enqueue(self)
//
//        while let node = queue.dequeu() {
//            if let leftChild = node.leftChild {
//                visit(leftChild)
//                queue.enqueue(leftChild)
//            }
//
//            if let rightChild = node.rightChild {
//                visit(rightChild)
//                queue.enqueue(rightChild)
//            }
//        }
//    }
//}

// Binary Tree - Abstract data type
// the components of a tree are the root node, child node
// a node is referred to as a leaf if it does not have
// any children
// There are 2 ways to traverse a binary tree
// 1. Breadth-first traversal - uses a queue to keep track of visited nodes
// 2. Depth-first traversal: in-order, post-order, pre-order
class BinaryTreeNode<T> {
  var value: T // T is a generic, can hold any data type, e.g Int, String....
  var leftChild: BinaryTreeNode?
  var rightChild: BinaryTreeNode?
  init(_ value: T) {
    self.value = value
  }
}

// queue - is a FIFO data structure
// FIFO - first in first out
struct Queue<T> {
  private var elements = [T]()
  
  public var isEmpty: Bool {
    return elements.isEmpty
  }
  
  public var count: Int {
    return elements.count
  }
  
  // looks at the front of the queue (line)
  public var peek: T? {
    return elements.first
  }
  
  // add an element to the back of the queue
  public mutating func enqueue(_ item: T) {
    elements.append(item) // O(1)
  }
  
  // removes the first element from the (front) queue
  public mutating func dequeue() -> T? {
    guard !elements.isEmpty else { return nil }
    return elements.removeFirst() // O(n) // we will optimize post CTA
  }
}


/*
          root
            1
           / \
          2   3
         / \
        4   5
*/

let rootNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)

rootNode.leftChild = twoNode
rootNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode


/*
          root
            1
           / \
          2   3
         / \
        4   5
*/

extension BinaryTreeNode {
  func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
    // using a queue to keep track of nodes as they are being visited
    // enqueues any children of that node to the Queue
    var queue = Queue<BinaryTreeNode>()
    visit(self) // self represents the root node
    // visit(self) // we are capturing the current node as opposed to printing in this method
    queue.enqueue(self) // add the root node to the queue
    // we are adding the root node to the queue in order to also visit its children (left, right child)
    
    while let node = queue.dequeue() {
      // check for left child and enqueue as needed
      if let leftChild = node.leftChild { // using optional binding
        visit(leftChild)
        queue.enqueue(leftChild)
      }
      // check for right child and enqueue as needed
      if let rightChild = node.rightChild {
        visit(rightChild)
        queue.enqueue(rightChild)
      }
    }
  }
}


// test out breadth-first traversal
print("breadth-first traversal")
rootNode.breadthFirstTraversal { (node) in
  print(node.value, terminator: " ") // 1 2 3 4 5
}

print("\n")


//====================================================================================================================
//                                                      Practice Questions
//====================================================================================================================

struct Stack<T: Equatable>: Equatable {
    private var elements = [T]()
    
    static func ==(lhs: Stack, rhs: Stack) -> Bool {
        return lhs.elements == rhs.elements
    }
    
    public var peek: T? {
        return elements.last
    }
    
    public var count: Int {
        return elements.count
    }
    
    public var isEmpty: Bool {
        return elements.isEmpty
    }
    
    // add to the top of the stack (end)
    public mutating func push(_ value: T) {
        elements.append(value) // O(1)
    }
    
    public mutating func enqueue(_ item: T) {
          elements.append(item)
      }
    
    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
    
    // remove from the top of the stack
    public mutating func pop() -> T? {
        guard !elements.isEmpty else {
            return nil
        }
        return elements.removeLast() // O(1)
    }
}

var stack = Stack<Int>()
stack.push(5)
stack.push(9)
stack.push(17)
stack.push(30)

var otherStack = Stack<Int>()
otherStack.push(15)
otherStack.push(120)
otherStack.push(2)

//Problem One:
//Find the largest integer in a Stack of Ints
func largest(stack: Stack<Int>) -> Int {
    var stack = stack
    var number = 0
    var largestNumber = 0
    
    while stack.count != 0 {
        number = stack.pop()!
        if number > largestNumber {
            largestNumber = number
        } else {
            
        }
    }
    
    return largestNumber
}





assert(largest(stack: stack) == 30, "should be equal to 30")
assert(largest(stack: otherStack) == 120, "should be equal to 120")



//Problem Two:
//Find the sum of a Stack of Ints
func sum(stack: Stack<Int>) -> Int {
    var stack = stack
    var values = 0
    var sum = 0
    while !stack.isEmpty {
        values = stack.pop()!
        sum += values
    }
    return sum
}

assert(sum(stack: stack) == 61, "should be equal to 61")
assert(sum(stack: otherStack) == 137, "should be equal to 137")

print(sum(stack: stack))
print(sum(stack: otherStack))


//Problem Three:
//Reverse a Stack without using an Array
//Sample input:
/*
 4
 2
 9
 3
 */

//Sample output:
/*
 3
 9
 2
 4
 */

func reverse<T: Comparable>(stack: Stack<T>) -> Stack<T> {
    var stack2  = stack
    var value = stack2.peek
    var reversedStack = stack2
    while stack2.count != 0 {
        value = stack2.peek
        reversedStack.push(value!)
        reversedStack.dequeue()
        stack2.pop()
        
    }
    
    return reversedStack
}

var originalStack = Stack<Int>()
originalStack.push(4)
originalStack.push(2)
originalStack.push(9)
originalStack.push(3)

var reversedStack = Stack<Int>()
reversedStack.push(3)
reversedStack.push(9)
reversedStack.push(2)
reversedStack.push(4)

assert(reverse(stack: originalStack) == reversedStack, "should be equal to reversedStack")



//Problem Four:
//Write a function that pushes a new element to the bottom of a Stack
func pushBottom<T>(stack: Stack<T>, newElement: T) -> Stack<T> {
     var newStack = stack
     var bottomStack = stack
     var value = newStack.peek
     bottomStack.push(newElement)
      
     while !newStack.isEmpty {
       value = bottomStack.dequeue()
        
       
      
     bottomStack.push(value!)
       newStack.pop()
     }
      
      
     
    return bottomStack
}

var stackWithoutNewElement = Stack<Int>()
stackWithoutNewElement.push(10)
stackWithoutNewElement.push(3)
stackWithoutNewElement.push(7)
stackWithoutNewElement.push(-8)



var stackWithNewElement = Stack<Int>()
stackWithNewElement.push(17)
stackWithNewElement.push(10)
stackWithNewElement.push(3)
stackWithNewElement.push(7)
stackWithNewElement.push(-8)

print(pushBottom(stack: stackWithoutNewElement, newElement: 17))

assert(pushBottom(stack: stackWithoutNewElement, newElement: 17) == stackWithNewElement, "should be equal stack with new element")


