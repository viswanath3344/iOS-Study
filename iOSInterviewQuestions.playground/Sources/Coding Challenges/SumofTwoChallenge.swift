import Foundation

import Foundation

// Sum of two problem

let array1 = [1, 3, 9, 8, 4, 6, 8, 10]

func sumOfTwoItemsExists(array: [Int], sum: Int) -> Bool {
    
    for i in array1 {
        for j in array1 where j != i {
            if i + j == sum {
                print("sum of \(i) and \(j) is: \(i+j), so : True")
                return true
            }else {
                print("sum of \(i) and \(j) is: \(i+j), so : False")
            }
        }
    }
    
    return false
}


//// Complexity Big O(n2)
//let result = sumOfTwoItemsExists(array: array1, sum: 12)
//print(result)



func sumOfTwoItemsWithPointers(values: [Int], sum: Int) -> Bool {
    var startIndex = 0
    var endIndex = values.count-1
    
    while startIndex < endIndex {
        let sumOfValue = values[startIndex] + values[endIndex]
        print(sumOfValue)
        if sumOfValue == sum {
            print("sum of \(values[startIndex]) and \(values[endIndex]) is: \(values[startIndex]+values[endIndex]), so : True")
            return true
        } else if sumOfValue < sum {
            startIndex += 1
        }
        
        else if sumOfValue > sum {
            endIndex -= 1
        }
    }
    
    print("Not found any sequence")
    return false
    
}


// Complexity Big O(n), It should be is sorted order
//let result1 = sumOfTwoItemsWithPointers(values: array1.sorted(), sum: 12)
//print(result1)


//let array1 = [1, 3, 9, 8, 4, 6, 8, 10]
func hasPairWithSum(numbers: [Int], targetSum: Int) -> Bool {
    var complements = [Int: Int]() // key: number , value: index
    
    for (index,number) in numbers.enumerated() {
        
        let complement = targetSum - number
        
        if let _ = complements[complement]  {
            print("Found pair value ")
            return true
        }
        
        complements[number] = index
    }
    
    return false
}

print(hasPairWithSum(numbers: array1, targetSum: 16))
