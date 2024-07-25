import Foundation


// Binary search

// Find the element with comparison with mid value and slice down array.
// if the less than middle value, slice the right side from mid value
// If the greater than the middle value, slice the left side from mid value
// binary search works on sorted array.

let array = [10,20,1, 5, 8, 30, 22, 403, 23, 32, 39].sorted()

func binarySearch(array: [Int], key: Int) -> Bool {
    if array.count == 0 { return false }
    
    let minIndex = 0
    let maxIndex = array.count-1
    let midIndex = array.count/2
    let midValue = array[midIndex]
    
    if key < array[minIndex] || key > array[maxIndex] {
        return false
    }
    
    print("key: \(key)" )
    print("midValue: \(midValue)")
    if key > midValue {
        let sliceArray = Array(array[midIndex+1...maxIndex])
        print("Right slice: \(sliceArray)")
        return binarySearch(array: sliceArray, key: key)
    }
    
    if key < midValue {
        let sliceArray = Array(array[minIndex...midIndex-1])
        print("Left slice: \(sliceArray)")
        return binarySearch(array: sliceArray, key: key)
    }
    
    if key == midValue {
        print("Found key and Mid Value")
        return true
    }
    
    return false
}

print(binarySearch(array: array, key: 20))
