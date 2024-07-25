import Foundation

/*
 MARK: Definition
 -----------------
   Factory Design pattern uses for creating the products (classes). Generally Factory manufacture the products, similarly Factory design pattern also uses the same approach to create the classes.
 
 MARK: Approach
 ------------------
 We will have Factory class -> That takes inputs required for create the product (class) -> Creates the object and returns.
 
  Step1: RandomValue is protocol have a value property of type AnyHashable, IntRandomValue, StringRandomValue, DoubleRandomValue confirms to that RandomValue and implemented the randomValue generation logic.
 
   
  Step2: Create Factory for each concrete class and will have one client
    
 
 
 MARK: Examples || Use cases
 -------------------------
  RandomValue generation for Int, String, Double..
  Document operations of type text, SpreadSheet, PDF,..
  Shape
 
  MARK: Realtime Examples
  ViewControllers Factory : Creates the ViewControllers for specific type
  ViewModels Factory: Creates a viewModels for specific type.
 
  NetworkRequest Factory: get users , getPosts ..
 
  ViewsFactory/ Table Cells Factory...
 
  
 */


// MARK: Example 1
protocol RandomValue {
    var value: AnyHashable { get }
}

struct IntRandomValue: RandomValue {
    var value: AnyHashable {
        Int.random(in: 0...100000)
    }
}

struct StringRandomValue: RandomValue {
    var value: AnyHashable {
        UUID().uuidString
    }
}

struct DoubleRandomValue: RandomValue {
    var value: AnyHashable {
        Date.timeIntervalSinceReferenceDate
    }
}

protocol RandomValueFactory {
    func createRandomValue() -> RandomValue
}

struct IntRandomValueFactory: RandomValueFactory {
    func createRandomValue() -> RandomValue {
        return IntRandomValue()
    }
}

struct StringRandomValueFactory: RandomValueFactory {
    func createRandomValue() -> RandomValue {
         return StringRandomValue()
    }
}

struct DoubleRandomValueFactory: RandomValueFactory {
    func createRandomValue() -> RandomValue {
        return DoubleRandomValue()
    }
}

struct Client {
    enum RandomType {
        case int, string, double
    }
    
   static func createRandomFactory(for type: RandomType) -> RandomValueFactory {
        switch type {
        case .int:
            IntRandomValueFactory()
        case .string:
            StringRandomValueFactory()
        case .double:
            DoubleRandomValueFactory()
        }
    }
}

let client = Client.createRandomFactory(for: .double)

print(client.createRandomValue().value)


// MARK: Example 2
protocol Document {
  func open()
  func close()
  func edit(content: String)
}

class TextDocument: Document {
  func open() {
    print("Opening Text Document")
  }
  
  func close() {
    print("Closing Text Document")
  }
  
  func edit(content: String) {
    print("Editing Text Document content: \(content)")
  }
}

class SpreadsheetDocument: Document {
  func open() {
    print("Opening Spreadsheet Document")
  }
  
  func close() {
    print("Closing Spreadsheet Document")
  }
  
  func edit(content: String) {
    print("Editing Spreadsheet Document content: \(content)")
  }
}

class DocumentFactory {
  func createDocument(type: String) -> Document? {
    switch type {
    case "text":
      return TextDocument()
    case "spreadsheet":
      return SpreadsheetDocument()
    default:
      return nil
    }
  }
}

let docFactory = DocumentFactory()
let textDoc = docFactory.createDocument(type: "text")
textDoc?.open() // Output: Opening Text Document


// MARK: Example3
