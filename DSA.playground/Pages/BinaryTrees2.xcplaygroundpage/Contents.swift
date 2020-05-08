import UIKit

//Fellow 1:
//Implement a Binary Tree.
//Implement Breadth-first traversal
//Fellow 2:
//Implement inorder traversal
//Implement post-order traversal
//Implement pre-order traversal
//
//   1
//  / \
//  2  3
// / \
// 4  5
//
//Breadth-first traversal = [1, 2, 3, 4, 5]
//inorder traversal = [2, 1, 3]
//post-order traversal = [2, 3, 1]
//pre-order traversal = [1,2,4,5,3]

class BinaryTreeNode<T> {
  var leftBranch: BinaryTreeNode?
  var rightBranch: BinaryTreeNode?
  var value: T

 init(_ value: T) {
   self.value = value
 }

}

class Queue<T> {
 var elements = [T]()

 var top: T? {
   return elements.first
 }

 var isEmpty: Bool {
   return elements.isEmpty
 }

init() {

}

func enqueue(_ element: T) {
  elements.append(element)
}

func dequeue()-> T? {
  guard !isEmpty else {return nil}
  return elements.removeFirst()
}

}

extension BinaryTreeNode {
  func breadthFirstTraversal(visit: (BinaryTreeNode) -> ()) {
    let queue = Queue<BinaryTreeNode>()
    visit(self) // root = 1 binarytreenode.val = 1
    queue.enqueue(self) // [1]

    while let branch = queue.dequeue() {
      if let leftBranch = branch.leftBranch {
        visit(leftBranch)
        queue.enqueue(leftBranch)
      }
      if let rightBranch = branch.rightBranch {
        visit(rightBranch)
        queue.enqueue(rightBranch)
      }
    }

  }
  func inOrderTraversal() {


  }
  func preOrderTraversal() {

  }
  func postOrderTraversal() {

  }
}


var tree = BinaryTreeNode(1)
tree.leftBranch = BinaryTreeNode(2)
tree.rightBranch = BinaryTreeNode(3)

