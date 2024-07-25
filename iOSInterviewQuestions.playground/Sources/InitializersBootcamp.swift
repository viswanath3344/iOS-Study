import Foundation
import UIKit

class Insurance {
    var name: String
    var type: String
    
    // Designated Initialisers: It can have one or multiple
//    init(name: String, type: String) {
//        self.name = name
//        self.type = type
//    }
    
    convenience init?(type: String) {
        let name = "Bajaj Insurance"
        self.init(name: name, type:type)
    }
    
    convenience init?(name: String) {
        let type = "Appollo"
        self.init(name: name, type: type)
    }
    
    // Fail-able initialiser
    init?(name: String, type: String) {
        if name.isEmpty || type.isEmpty {
            return nil
        }
        
        self.name = name
        self.type = type
    }
}
//
//let insurance = Insurance(name: "", type: "Term")
//print(insurance)



class Vehicle {
    var name: String
    var model: String
    
    required init(name: String, model: String) {
        self.name = name
        self.model = model
    }
}

class Car: Vehicle {
    let price: Double?
//    required init(name: String, model: String) {
//        super.init(name: name, model: model)
//    }

    
    required init(name: String, model: String) {
        self.price = nil
        super.init(name: name, model: model)
    }
}

class FirstViewController: UIViewController {
    var name: String
    
    init(name: String) {
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

let firstViewController = FirstViewController(name: "Viswa")
print(firstViewController.name)

//let car = Car(price: 1000000)
//print(car.name)


// Designated Initialisers
// Convince Initialisers
// Fail-able Initialisers
// Required Initialisers
