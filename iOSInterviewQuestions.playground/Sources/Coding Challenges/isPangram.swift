import Foundation

func isPangram(_ str: String) -> Bool {
  let lowercaseString = str.lowercased()
  let alphabetSet = Set("abcdefghijklmnopqrstuvwxyz")
  
  for char in alphabetSet {
    if !lowercaseString.contains(char) {
      return false // Not a pangram if a character is missing
    }
  }
    
  return true // All characters found, it's a pangram
}

let testString1 = "The quick brown fox jumps over the lazy dog"
let result1 = isPangram(testString1)
print(result1) // Output: true (pangram)

let testString2 = "This is not a pangram"
let result2 = isPangram(testString2)
print(result2) // Output: false (not a pangram)
