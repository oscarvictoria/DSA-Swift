import UIKit

// merge sort
// worst, best, and average runtime is O(n log n)
// uses divide and conquer
// splits the array in two using the middle index
// uses recursion until a base case count is greater than 1
// then merges individual array's back together while sorting

func mergeSort< T: Comparable >(_ arr: [T]) -> [T] {
    // base case count is greater than 1
    guard arr.count > 1 else { return arr }
    
    let middleIndex = arr.count / 2
    
    // left array includes beggining array up to but not including the middle
    let leftArr = mergeSort(Array(arr[..<middleIndex]))
    
    let rightArr = mergeSort(Array(arr[middleIndex...]))
    
    
    
    return merge(leftArr, rightArr)
}


// Combine two sorted arrays

func merge< T: Comparable >(_ leftArray: [T], _ rightArray: [T]) -> [T] {
    var leftIndex = 0
    var rightIndex = 0
    var resultArray = [T]()
    
    while leftIndex < leftArray.count && rightIndex < rightArray.count {
        let leftElement = leftArray[leftIndex]
        let rightElement = rightArray[rightIndex]
        
        if leftElement < rightElement {
            resultArray.append(leftElement)
            leftIndex += 1
        } else if leftElement > rightElement {
            resultArray.append(rightElement)
            rightIndex += 1
        } else {
            resultArray.append(leftElement)
            leftIndex += 1
            resultArray.append(rightElement)
            rightIndex += 1
        }
    }
    
    if leftIndex < leftArray.count {
        resultArray.append(contentsOf: leftArray[leftIndex...])
    }
    
    if rightIndex < rightArray.count {
        resultArray.append(contentsOf: rightArray[rightIndex...])
    }
    
    return resultArray
}

let list = [13, 8, 29, -100, 0, 234]

let sortedList = mergeSort(list)

print(sortedList)


class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        
        guard nums.count > 1 else { return nums }
        
        let middleIndex = nums.count / 2
        
        let leftArray = sortArray(Array(nums[..<middleIndex]))
        let rightArray = sortArray(Array(nums[middleIndex...]))
        
        return mergeArray(leftArray, rightArray)
    }
    
    func mergeArray(_ leftArray:[Int], _ rightArray: [Int]) -> [Int] {
        var leftIndex = 0
        var rightIndex = 0
        var mergedArray = [Int]()
        
        while leftIndex < leftArray.count && rightIndex < rightArray.count {
            let leftElement = leftArray[leftIndex]
            let rightElement = rightArray[rightIndex]
            
            if leftElement < rightElement {
                mergedArray.append(leftElement)
                leftIndex += 1
            } else if rightElement < leftElement {
                mergedArray.append(rightElement)
                rightIndex += 1
            } else {
                mergedArray.append(leftElement)
                leftIndex += 1
                mergedArray.append(rightElement)
                rightIndex += 1
            }
            
        }
        
        if leftIndex < leftArray.count {
            mergedArray.append(contentsOf: leftArray[leftIndex...])
        }
        
        if rightIndex < rightArray.count {
            mergedArray.append(contentsOf: rightArray[rightIndex...])
        }
        
        return mergedArray
    }
}

