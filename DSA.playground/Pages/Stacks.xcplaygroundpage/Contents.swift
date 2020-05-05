import Foundation

// Leetcode question Min Stack 155.
class MinStack {
    var stack:[Int]
    var minStack: [Int]
    
    init() {
        self.stack = [Int]()
        self.minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if minStack.isEmpty || x <= minStack.last! {
            minStack.append(x)
        }
    }
    
    func pop() {
        guard stack.count > 0 else { return }
        if stack.last == minStack.last {
            minStack.removeLast()
        }
        stack.removeLast()
        
    }
    
    func top()-> Int {
        guard stack.count > 0 else { return 0 }
        return stack.last ?? 0
        
    }
    
    func getMin() -> Int {
        return minStack.last ?? 0
    }
    
}

let someStack = MinStack()

someStack.push(2)
someStack.push(0)
someStack.push(3)
someStack.push(0)
print(someStack.stack.count)
someStack.getMin()
someStack.pop()
someStack.getMin()
someStack.pop()
someStack.getMin()
someStack.pop()
someStack.getMin()
print(someStack.stack.count)
