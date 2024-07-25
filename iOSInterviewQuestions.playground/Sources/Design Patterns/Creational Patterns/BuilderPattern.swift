import Foundation

/*
 Builder pattern is step-by-step to build complex objects
 */

/* We have a builder class, that have properties and methods to prepare the required class,
Builder class have method that Return the Builder class object itself, finally it will have build method that returns the required class.
 
 MARK: Example1
 
 PizzaBuilder for build the Pizza class. Pizza builder will have size, toppings, name and other details.
 Ot will have a methods for addSize, addTopping,... methods those return the builder object. finally we will have build method that creates a Pizza Object based on the inputs given.
 
 finally We call it as
 
   Builder().addFirsProperty().addSecondProperty().build()
 
  MARK: Example 2
   We can use this builder pattern for URL builder to input the http Method, parameters,...
 
  MARK: Example 3
   Swift UI screens also using the builder pattern to build views with modifiers...
    
*/
class PizzaBuilder {
    private var size: String?
    private var toppings: [String] = []
    private var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func addSize(size: String) -> PizzaBuilder{
        self.size = size
        return self
    }
    
    func addTopping(topping: String) -> PizzaBuilder {
        self.toppings.append(topping)
        return self
    }
    
    func build() -> Pizza {
        return Pizza(name, size!, toppings)
    }
}

class Pizza: CustomStringConvertible {
    let name: String
    let size: String?
    let toppings: [String]
    
    init(_ name: String, _ size: String, _ toppings: [String]) {
        self.name = name
        self.size = size
        self.toppings = toppings
    }
    
    var description: String {
        var description = "name: \(name), size: \(size!), toppings"
        description.append(toppings.reduce("\n", +))
        return description
    }
}

func main1() {
    let pizza = PizzaBuilder(name: "Macrons Pizza")
        .addSize(size: "Medidum")
        .addTopping(topping: "Flakes")
        .addTopping(topping: "Cheese")
        .build()
    
    print(pizza)
}

main1()


class CodeBuilder: CustomStringConvertible {
    let className: String
    var fileds: [String: String] = [:]
    
    init(className: String) {
        self.className = className
    }
    
    func addField(called name: String, ofType type: String) -> CodeBuilder {
        self.fileds[type] = name
        return self
    }
    
    func build() -> String {
        var code = "class \(className) \n {\n"
        
        for (type, key) in fileds {
            code.append("  var \(key): \(type) \n")
        }
    
        code.append(" }")
        
        return code
    }
    
    var description: String {
        return build()
    }
}


func main() {
    let codeBuilder = CodeBuilder(className: "Person")
    
   let result = codeBuilder.addField(called: "name", ofType: "String")
        .addField(called: "age", ofType: "Int")
        .build()
    
    print(result.description)
}

main()
