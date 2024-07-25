import Foundation

func removeDuplicatesFromString(text: String) -> String {
     return String(Set(text))
}


func removeDuplicatesWithLooping(text: String) -> String {
    var newText = ""
    
    for char in text {
        if !newText.contains(char) {
            newText.append(char)
        }
    }
    
    return newText
}

print(removeDuplicatesFromString(text: "Mississippi"))
print(removeDuplicatesWithLooping(text: "Mississippi"))


