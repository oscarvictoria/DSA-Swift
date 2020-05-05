import UIKit

// questions
/*
 big o notation
 string
 recursion
 linked list
 */

//problem 1: O(1) - constant time
//problem 2: O(n) - linear time
//problem 3: O(n ^ 2) - quadratic time
//problem 4: O(1) - constant time
//problem 5: O(n ^ 2) - quadratic time
//problem 6: O(n) - linear time
//problem 7: O(n ^ 2) - quadratic time
//problem 8: O(n) - linear time
//=================================================================================
//                Questions: Big O Notation
//=================================================================================
// problem 1: what is the runtime
//problem 1: O(1) - constant time
func exampleOne(arr: [String]) {
  for _ in 0..<1_000_000 {
    print("Many printings!")
  }
}
// problem 2: what is the runtime
//problem 2: O(n) - linear time
func exampleTwo(arr: [String]) {
  for string in arr {
    print(string)
  }
}
// problem 3: what is the runtime
//problem 3: O(n ^ 2) - quadratic time
func exampleThree(arr: [String]) {
  for stringOne in arr {
    for stringTwo in arr {
      print("Player One: \(stringOne), Player Two: \(stringTwo)")
    }
  }
}
// problem 4: what is the runtime
//problem 4: O(1) - constant time
func exampleFour(arr: [String]) {
  guard arr.count > 0 else {
    return
  }
  print(arr[0])
}
// problem 5: what is the runtime
//problem 5: O(n ^ 2) - quadratic time
func exampleFive(arr: [Int]) -> Int {
  var counter = 0
  for num in arr {
    if arr.contains(num+1) {
      counter += 1
    }
  }
  return counter
}
// problem 6: what is the runtime
//problem 6: O(n) - linear time
func exampleSix(string str: String, withCharacter c: Character) -> Bool {
  for char in str {
    if char == c {
      return true
    }
  }
  return false
}
// problem 7: what is the runtime
//problem 7: O(n ^ 2) - quadratic time
func example7(arr: [Int]) {
  for num in arr {
    print(num)
  }
  for _ in arr {
    for num in arr {
      print(num)
    }
  }
  for num in arr {
    print(num)
  }
}
// problem 8: what is the runtime
//problem 8: O(n) - linear time
func secondSmallest(myArr: [Int]) -> Int? {
  guard myArr.count > 1 else {
    return nil
  }
  var min = myArr[0]
  var minIndex = 0
  for (index, num) in myArr.enumerated() {
    if num < min {
      min = num
      minIndex = index
    }
  }
  var secondMin = (myArr[0] != min ? myArr[0] : myArr[1])
  for (index, num) in myArr.enumerated() {
    if num < secondMin && index != minIndex {
      secondMin = num
    }
  }
  print(min, minIndex, secondMin)
  return secondMin
}
//=================================================================================
//                          Questions: String
//=================================================================================
// problem 1 // palindrome, pangram, anagram
/*
Palindrome.
Given a string str, write a functin that will return
true if is a palindrome and false if it is not?
If you recall, a palindrome is defined as "a word,
phrase, or sequence that reads the same backward as
forward". For now, assume that we will not have input
strings that contain special characters or spaces, so
the following examples hold:
Example 1:
Input:
let str = "thisisnotapalindrome"
Output: false
Example 2:
Input:
let str = "racecar"
Output: true
*/

func isPalindrome(_ value: String)-> Bool {
    
    guard value.count >= 2 else {return true}
    
    let end = value.index(value.endIndex, offsetBy: -1)
    
    if value[value.startIndex] == value[end] {
        let start = value.index(value.startIndex, offsetBy: 1)
        return isPalindrome(String(value[start..<end]))
    }
    return false
}

isPalindrome("racecar")


//=================================================================================
//                          Questions: Recursion
//=================================================================================
// problem 1
/*
 Multiply two given Ints.  Do not use for/while loops or the * operator.
 Sample Input: 5 * 6
 Sample Output: 30
*/



// problem 2 // hint: you can use function arguments to hold variable states
/*
 Find the sum of all the even numbers in an array
 Sample Input: [3,6,1,3,2, 10]
 Sample Output: 18
*/

func addEven(_ arr: [Int])-> Int {
    var sum = 0
    var evenArray = [Int]()
    
    for num in arr {
        if num % 2 == 0 {
            evenArray.append(num)
        }
    }
    
    for num in evenArray {
             sum += num
         }
    
    return sum
}


func evenSum(numArray: [Int]) -> Int {
  var sum = 0
  for num in numArray {
    if num % 2 == 0 {
      sum += num
    }
  }
   return sum
}


// problem 3
// https://www.hackerrank.com/challenges/30-recursion/problem
//=================================================================================
//                          Questions: Linked List
//=================================================================================
class LLNode {
  var value: Int
  var next: LLNode?
  init(_ value: Int) {
    self.value = value
  }
    
    
    
}


let node1 = LLNode(1)
let node2 = LLNode(2)
let node9 = LLNode(9)
let node4 = LLNode(4)
let node5 = LLNode(5)
node1.next = node2
node2.next = node9
node9.next = node4
node4.next = node5

func getMax(_ list: LLNode)-> Int {
    var list = list
    var largestElement = 0
    
    while list.next != nil {
        
        if list.next!.value > largestElement {
            largestElement = list.value
        }
        list = list.next!
        
    }
    
    return largestElement
}

print(getMax(node1))





// problem 1
// Using the Linked List above, write a function that finds the largest number in a Linked List of Ints.
// output: 9
// problem 2
// https://leetcode.com/problems/reverse-linked-list/
//=================================================================================
//                          Solutions: Big O Notation
//=================================================================================
/*
 problem 1: O(1) - constant time
 problem 2: O(n) - linear time
 problem 3: O(n ^ 2) - quadratic time
 problem 4: O(1) - constant time
 problem 5: O(n ^ 2) - quadratic time
 problem 6: O(n) - linear time
 problem 7: O(n ^ 2) - quadratic time
 problem 8: O(n) - linear time
*/


//func pattern(pattern: String, sentance: String)-> Bool {
//    let array = sentance.components(separatedBy: "")
//    let patternArray = pattern.components(separatedBy: "")
//
//    var dick = [String: String]()
//
//
//    for index in 0...patternArray.count - 1 {
//        if dick[patternArray[index]] == nil {
//            dick[patternArray[index]] = array[index]
//        } else {
//            if dick[patternArray[index]] != array[index] {
//                return false
//            }
//        }
//    }
//
//
//    return true
//}
//
//var sentence1 = "apple banana apple"
//var pattern = "1 2 1"

//print(pattern: pattern, sentence: sentence1))

//4. Write a func that takes in a pattern: "aba" and words and returns whether the words appear in the order of the pattern.

func pattern(pattern: String, sentence: String) -> Bool {
    let array = sentence.components(separatedBy: " ")
    let patternArray = Array(pattern)
    var dick = [Character: String]()
    
    for index in 0...patternArray.count - 1 {
        if dick[patternArray[index]] == nil {
            dick[patternArray[index]] = array[index]
            print(dick)
        } else {
            if dick[patternArray[index]] != array[index] {
            return false
            }
         }
    }
    return true
}
var sentence1 = "apple banana apple"
var pattern = "cac"
print(pattern(pattern: pattern, sentence: sentence1))

