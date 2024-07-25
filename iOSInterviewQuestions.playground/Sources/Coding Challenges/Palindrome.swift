import Foundation

// Check string is Palindrome // Reverse string should match with original string.


// simple way
func isPalindrome(text: String) -> Bool {
    let lowercasedString = text.lowercased()
    let reversedString = String(lowercasedString.reversed())
    return lowercasedString == reversedString
}


// Using while loop with Array
func isPalindromeOption2(text: String) -> Bool {
    let lowercaseString = Array(text.lowercased())
    
    var startIndex = 0
    var endIndex = lowercaseString.count-1
    
    print(startIndex)
    print(endIndex)
    
    while startIndex < endIndex {
        if lowercaseString[startIndex] != lowercaseString[endIndex] {
            return false
        }
        
        startIndex = startIndex+1
        endIndex = endIndex-1
    }
    
    return true
}

// With Indexes
func isPalindromeOption3(text: String) -> Bool {
    
    let lowercasedString = text.lowercased()
    
    var startIndex = text.startIndex
    var endIndex = text.index(before: text.endIndex)
    
    while startIndex < endIndex {
        if text[startIndex] != text[endIndex] {
            return false
        }
        
        startIndex = text.index(after: startIndex)
        endIndex = text.index(before: endIndex)
    }
    
    return true
}

//isPalindrome(text: "racecar")

isPalindromeOption2(text: "racecara")
