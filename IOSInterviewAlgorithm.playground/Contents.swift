import UIKit

var greeting = "Hello, playground"

func test_sequence(sequenceString: String) -> [Int] {
    let sequenceArray = Array(sequenceString)
    var finalArray = [String]()
    for (index, value) in sequenceArray.enumerated() {
        let nextIndex: Int = index+1
        if value == "E", nextIndex < sequenceArray.count {
            let nextElement = String(sequenceArray[nextIndex])
            finalArray.append(nextElement)
        } else if value == "D", !finalArray.isEmpty {
            finalArray.removeFirst()
        }
    }
    
    return finalArray.compactMap { Int($0) }
}

print(test_sequence(sequenceString: "E1E3DE5DE2E5E8"))

print(test_sequence(sequenceString: "E1E3DE5DE2E5E8E"))
