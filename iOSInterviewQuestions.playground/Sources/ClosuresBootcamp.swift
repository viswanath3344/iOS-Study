import Foundation
class ClosureBootcamp {
    
    func addNumbers() {
        print("Step1")
        
        add(value1: 1, value2: 5) { result in
            print("Result:", result)
        }
        
        print("Final Step")
    }
    
    // By default Non-Escaping closures.
    private func add(value1: Int, value2: Int, completionHandler: (Int) -> Void) {
        print("Step 2")
        let result = value1 + value2
        
        print("Step 3")
        completionHandler(result)
    }
    
    // By default Non-Escaping closures. Instead we can return value
    private func add(value1: Int, value2: Int) -> Int {
        print("Step 2")
        return value1 + value2
    }
    
    func subtractNumbers() {
        print("Step1")
        
        subtract(value1: 1, value2: 5) { result in
            print("Result:", result)
        }
        
        print("Final Step")
    }
    
    // By default Non-Escaping closures.
    private func subtract(value1: Int, value2: Int, completionHandler: @escaping (Int) -> Void) {
        print("Step 2")
        let result = value1 - value2
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 10) {
            print("Step 3")
            completionHandler(result)
        }
    }
}


let closureBootcamp = ClosureBootcamp()
closureBootcamp.addNumbers()





// Empty Closure
let emptyClosure = {
    print("I am an empty closure")
}

// Closure with Parameters and return values
let parameterClosure =  { (value1: Int, value2: Int) -> Int in
    print("I have parameters \(value1) \(value2)")
    return value1 + value2
}

print(emptyClosure())
print(parameterClosure(10, 50))


// Trailing closures
func greetings(name: String, completionHandler: (String) -> Void) {
    completionHandler(name)
}

greetings(name: "Viswa") { name in
    print("Hello \(name)")
}

// Auto closures
func greetings1(name: String, @autoclosure completionHandler: ()->()) {
    completionHandler()
}

greetings1(name: "Ravs", print("Hello..., I am a auto closure")

/* Concepts Covered
 -> Empty Closures
 -> Closures with parameters
 -> Escaping/ Non Escaping closures.
 -> Trailing closures
 -> Auto Closures

