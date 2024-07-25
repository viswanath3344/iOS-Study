import Foundation

func doTwoStringsContainsSameChars(text1: String, text2: String) -> Bool {
    return text1.lowercased().sorted() == text2.lowercased().sorted()
}
 
print(doTwoStringsContainsSameChars(text1: "Hello", text2: "lloHe"))
