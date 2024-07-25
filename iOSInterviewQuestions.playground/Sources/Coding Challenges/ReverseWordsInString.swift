import Foundation

// Reverse words in sentence

func reverseWordsInSetence(text: String) -> String {
    let reverseArray = text.components(separatedBy: " ")
    return reverseArray.reversed().joined(separator: " ")
}

func reverseWordsByLoop(text: String) -> String {
    var reverseString = ""
    var currentWord = ""
    
    for (index, char) in text.enumerated() {
        if char.isWhitespace{
            reverseString =  currentWord + " " + reverseString
            currentWord = ""
        } else {
            currentWord = currentWord + String(char)
        }
    }
    
    return currentWord + reverseString
}

//print(reverseWordsInSetence(text: "Viswa is name My"))

print(reverseWordsByLoop(text: "Viswa is name My "))
