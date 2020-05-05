import UIKit

class BinaryTreeNode<T> {
    var value: T
    var leftChild: BinaryTreeNode?
    var rightChild: BinaryTreeNode?
    
    init(_ value: T) {
    self.value = value
    }
}

extension BinaryTreeNode {
    
    func inOrderTreversal(visit: (BinaryTreeNode)-> ()) {
        leftChild?.inOrderTreversal(visit: visit)
        visit(self)
        rightChild?.inOrderTreversal(visit: visit)
    }
    
    func preOrderTraversal(visit: (BinaryTreeNode)->()) {
        visit(self)
        leftChild?.preOrderTraversal(visit: visit)
        rightChild?.preOrderTraversal(visit: visit)
    }
    
    func postOrderTraversal(visit: (BinaryTreeNode)->()) {
        leftChild?.postOrderTraversal(visit: visit)
        rightChild?.postOrderTraversal(visit: visit)
        visit(self)
    }
}


let treeNode = BinaryTreeNode<Int>(1)
let twoNode = BinaryTreeNode<Int>(2)
let threeNode = BinaryTreeNode<Int>(3)
let fourNode = BinaryTreeNode<Int>(4)
let fiveNode = BinaryTreeNode<Int>(5)
let sixNode = BinaryTreeNode<Int>(6)
let sevenNode = BinaryTreeNode<Int>(7)


treeNode.leftChild = twoNode
threeNode.rightChild = threeNode
twoNode.leftChild = fourNode
twoNode.rightChild = fiveNode


treeNode.inOrderTreversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")

// test pre order trsversal

print("pre order traversal")
treeNode.preOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

print("\n")

// test post order traversa;

print("post order traversal")

treeNode.postOrderTraversal { (node) in
    print(node.value, terminator: " ")
}

