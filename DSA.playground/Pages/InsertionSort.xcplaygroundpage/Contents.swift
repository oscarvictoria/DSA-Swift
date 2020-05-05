import UIKit

var str = "Hello, playground"

// sorting algorithms: O(n ^ 2), O(n log n)
// slower:

// Insertion sort
// runtime: O(n ^ 2)
// space: O(1)
// slightly more performant than bubble sort
// given a partially sorted and small sized array, could be a good choice sorting algorithm

// swift's sorting algorithm (hybrid algorithm) is n log n, uses insertion sort on small, partially sorted array's

func insertionAlgorithm(_ arr: inout [Int]) {
    guard arr.count >= 2 else { return }
    for current in 1..<arr.count {
        for j in (1...current).reversed() {
            if arr[j] < arr[j - 1] {
                // swap - using built-in swapAt
                arr.swapAt(j, j - 1)
            } else { // left side of array is sorted
                break // continue to outer loop
            }
        }
    }
}

var list = [4,5,8,2]

insertionAlgorithm(&list)
print(list)


// Implementing Lomoto's psrtitioning

func lomutoPartition(_ arr: inout [Int], low: Int, high: Int) -> Int {
    let pivot = arr[high]
    var i = low
    
    for j in low..<high {
        if arr[j] <= pivot {
            arr.swapAt(i, j)
            i += 1
        }
    }
    arr.swapAt(i, high)
    return i
}

func quicksortLumato(_ arr: inout [Int], low: Int, high: Int) {
    
    if low < high {
        let pivot = lomutoPartition(&arr, low: low, high: high)
        
        quicksortLumato(&arr, low: low, high: pivot - 1)
        
        quicksortLumato(&arr, low: pivot + 1, high: high)
    }
    
}
var listB = [80, 10, -9, 0, -11, 13, 37, 5, 4, 2, 12, 45, 32, 43, 53, 33, 13, 52, 86, 43, 43, 64, 3, 2, 5 ,5, 3, 3]




quicksortLumato(&listB, low: 0, high: listB.count - 1)


// bubble sort

func bubbleSort(_ arr:  inout [Int]) {
    for _ in 0..<arr.count {
        for j in 1..<arr.count { // n
            if arr[j] < arr[j - 1] { // m => O(n ^ 2) worst type of algorithm
                arr.swapAt(j, j - 1)
            }
        }
    }
}

var bubbleList = [80, 10, -9, 0, -11, 13, 37, 5, 4, 2, 12, 45, 32, 43, 53, 33, 13, 52, 86, 43, 43, 64, 3, 2, 5 ,5, 3, 3]

bubbleSort(&bubbleList)

