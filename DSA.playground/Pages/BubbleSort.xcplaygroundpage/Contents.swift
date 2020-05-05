import UIKit

var str = "Hello, playground"

// bubble sort
// sorting algorithm
// runtime: O(n^2) - quadratic (considered as the worst sorting algorithm)
// space complexity: O(n) - constant - sorts in place
// sort in place - inout function

func bubbleSort(_ arr: inout [Int]) { // inout indicates in place manipulation
    
    for _ in 0..<arr.count { // O(n)
        for j in 1..<arr.count { // O(n)
            if arr[j] < arr[j - 1] {
                // swap
                // implement swap without using the built in swap function
                let temp = arr[j] // saved the value at arr[j] brfore overwritting
                arr[j] = arr[j - 1]
                arr[j - 1] = temp
            }
        }
    }
    
}


var list = [10,3,1,6,7]

bubbleSort(&list)
print(list)

