import Foundation

func condenseWhiteSpace(text: String) -> String {
    var textArray = text.components(separatedBy: .whitespacesAndNewlines)
    print(textArray)
    textArray.removeAll { $0.isEmpty }
    print(textArray)
    return textArray.joined(separator: " ")
}

print(condenseWhiteSpace(text: "Hello   World. Welcome to      new    iOS Training."))
