import Foundation

// Merge sort

func mergeSort(array: [Int]) -> [Int] {
    print("called")
    guard array.count > 1 else {
        return array
    }
    
    let left = Array(array[0..<array.count/2])
    let right = Array(array[array.count/2..<array.count])
    
    print(left)
    print(right)
    
    // Recursive method calling.
    return merge(
        leftArray: mergeSort(array: left),
        rightArray: mergeSort(array: right)
    )
}

func merge(leftArray: [Int], rightArray: [Int]) -> [Int] {
    print("Called Merge")
    print("left Array: \(leftArray)")
    print("right Array: \(rightArray)")
    
    var mergeArray = [Int]()
    var left = leftArray
    var right = rightArray
    
    while left.count > 0 && right.count > 0 {
        if left.first! < right.first! {
            mergeArray.append(left.removeFirst())
        }else {
            mergeArray.append(right.removeFirst())
        }
    }
    
    return mergeArray + left + right
}


var values = [Int]()
for _ in 0...50 {
    values.append(Int.random(in: 0...2000))
}

let result = mergeSort(array: values)
print(result)

