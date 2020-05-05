import UIKit

// Queues: is a abstract data type that is FIFO structure (meaning: first object added is the first to be removed from the data structure)

// methods of a Queue:

// enqueue: add item to the back of the queue

struct Queue<T> {

    private var elements = [T]()

    public var isEmpty: Bool {
        return elements.isEmpty
    }

    public var count: Int {
        return elements.count
    }

    public var peek: T? {
        return elements.first
    }

    public mutating func enqueue(_ item: T) {
        elements.append(item)
    }

    public mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        return elements.removeFirst()
    }
}
//
//var queue = Queue<String>()
//
//queue.enqueue("Mel")
//queue.enqueue("Kelby")
//queue.enqueue("Oscar")
//
//print("\(queue.peek ?? "") is at the front of the line")
//
//queue.dequeue()
//
//print("fellows left in the line are \(queue)")
//
//var queueCopy = queue
//
//while let value = queueCopy.dequeue() {
//    print("fellow: \(value)")
//}
//
//print("there are \(queueCopy.count) fellows left in queueCopy")


//1. Find the smallest element in a queue

var someQueue = Queue<Int>()

someQueue.enqueue(1)
someQueue.enqueue(2)
someQueue.enqueue(3)
someQueue.enqueue(4)



func smallestElement<T: Comparable>(in q: Queue<T>) -> T? {
    
    var q = q
    
    guard !q.isEmpty else { return nil }

    guard var minValue = q.peek else { return nil }
    
    while let smallestQ = q.dequeue() {
       
        if smallestQ < minValue {
            
        minValue = smallestQ
    }
    
    
}
    return minValue

}


print(smallestElement(in: someQueue)!)



//2. Find the sum of a queue of Ints
func sum(of q: Queue<Int>) -> Int {
    
    var q = q
    
    var sum = Int()
    
    while let value = q.dequeue() {
        sum += value
    }
    
    return sum
}

sum(of: someQueue)

//3. Find out whether or not a queue is in sorted order from smallest to biggest
/*
True example:   (Back) 9 - 6 - 2 - 1 (Front)
False example   (Back) 4 - 19 - 1 - 20 (Front)
False example   (Back) 4 - 19 - 134 - 200 (Front)
*/

func isSorted<T: Comparable>(q: Queue<T>) -> Bool {
    guard !q.isEmpty else { return false }
    var q = q
    let qInitial = q
    var queueCopy = q
    

    guard let minValue = q.peek else { return false }
     
    queueCopy.enqueue(minValue)
    guard let copyMinValue = q.peek else { return false }
    
    while let value = q.dequeue() {
        if value > copyMinValue {
            queueCopy.dequeue()
            queueCopy.enqueue(value)
        } else {
            continue
        }
    }
    q = qInitial
    queueCopy.dequeue()
    
//    print(q)
//    print(queueCopy)
    
    
    if queueCopy.peek == q.peek  {
        
    return true
    } else {
        return false
    }
    
}


isSorted(q: someQueue)

var anotherQueue = Queue<Int>()

anotherQueue.enqueue(4)
anotherQueue.enqueue(2)
anotherQueue.enqueue(3)
anotherQueue.enqueue(1)

isSorted(q: anotherQueue)


//4. Given a Queue as input, return a reversed queue. (Hint: A stack can be helpful here)
/*
Sample Input:   (Back) 9 - 16 - 2 - 31 (Front)
Sample Output:  (Back) 31 - 2 - 16 - 9 (Front)
 */

func reversed<T>(q: Queue<T>) -> Queue<T> {
//    var q = q
//    let qInitial = q
//    var queueCopy = q
//
    
    
    
    return q
}

//5 Determine if two Queues are equal
func areEqual<T: Equatable>(qOne: Queue<T>, qTwo: Queue<T>) -> Bool {
    var qOne = qOne
    var qTwo = qTwo
    
    
    
    while let queueOneValues = qOne.dequeue() {
        
    }
    
    
    print(qOne)
    print(qTwo)
    
    
    if qTwo.peek == qOne.peek {
        return true
    } else {
        return false
    }
    
}

areEqual(qOne: someQueue, qTwo: anotherQueue)

