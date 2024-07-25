import Foundation

let colorNames: [String] = [
    "Red", "Green", "Blue", "Yellow", "Orange", "Purple", "Pink", "Brown", "Yellow", "Black", "White",
    "Gray", "Navy", "Maroon", "Olive", "Teal", "Indigo", "Violet", "Silver", "Gold",
    "Beige", "Tan", "Coral", "Turquoise", "Lavender", "Magenta", "Crimson", "Azure",
    "Lime", "Peach", "Salmon", "Ivory", "Khaki", "Aquamarine", "Magenta", "Crimson", // Duplicates
    "Red", "Green", "Blue", "Yellow", "Yellow" // More duplicates
]

// Find more duplicate color names in array


func getMostDuplicatedColorNames(colors: [String]) -> [String] {
    var colorDictionary = [String: Int]()
    
    for color in colors {
        if let value = colorDictionary[color] {
            colorDictionary[color] = value+1
        }else {
            colorDictionary[color] = 1
        }
    }
    
    let highestValue = colorDictionary.values.max()!
    
    for (key, value) in colorDictionary {
        if value == highestValue {
            return [key]
        }
    }
    
    return []
}


print(getMostDuplicatedColorNames(colors: colorNames))
