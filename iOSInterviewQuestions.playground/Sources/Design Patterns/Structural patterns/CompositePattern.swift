import Foundation

// composite design pattern
// Its as tree liked objects individual or group are uniformly.
// Example : Folder structure -> Folder may have folders and Files.

protocol Component {
    func getSize() -> Int
    func getName() -> String
}

class File: Component {
    let name: String
    let size: Int
    
    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
    
    func getName() -> String {
        return name
    }
    
    func getSize() -> Int {
        return size
    }
}

class Folder: Component {
    let name: String
    let size: Int
    var subComponents: [Component] = []
    
    init(name: String, size: Int) {
        self.name = name
        self.size = size
    }
    
    func addComponent(component: Component) {
        subComponents.append(component)
    }
    
    func getName() -> String {
        return name
    }
    
    func getSize() -> Int {
        var totalSize = 0
        
        for component in subComponents {
            totalSize += component.getSize()
        }
        return totalSize
    }
}


func main() {
    let directory = Folder(name: "iOS", size: 200)

    let iOSBasicsFile = File(name: "Basics", size: 20)
    let iOSInterviewFile = File(name: "Interview", size: 10)
    
    directory.addComponent(component: iOSBasicsFile)
    directory.addComponent(component: iOSInterviewFile)
    
    let newDirectory = Folder(name: "Swift UI", size: 40)
    newDirectory.addComponent(component: File(name: "Modifiers", size: 20))
    
    directory.addComponent(component: newDirectory)
    
    print(directory.getSize())
}


main()

