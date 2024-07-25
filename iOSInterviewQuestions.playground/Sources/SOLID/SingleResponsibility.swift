import Foundation

// Single Responsibility Principle

class Journal: CustomStringConvertible {
    var entities = [String]()
    
    func addEntity(_ entity : String) {
        entities.append(entity)
    }
    
    func removeEntity(at position : Int) {
        entities.remove(at: position)
    }
    
    var description: String {
        entities.joined(separator: "\n")
    }
    
    func addToFile(filePathpath: String) {
        
    }
}

class FileOperations {
    
    func addToFile(path: String, data: String)
}

func main() {
    let journal = Journal()
    journal.addEntity("I am Good boy")
    journal.addEntity("I likes to play cricket")
    
    print(journal)
    
    print("=====================")
    
    journal.removeEntity(at: 0)
    print(journal)
    
  //  FileOperations().addToFile(path: "var/usr/data/files", data: journal)
}


main()

