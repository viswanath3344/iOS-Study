import Foundation

import UIKit

// MEMORY Management test
class Vehicle {
    var car: Car?
    var id: String
    
    init(car: Car?, id: String) {
        self.car = car
        self.id = id
        print("Vehicle created")
    }
    
    deinit {
        print("Vehicle Deallocated")
    }
}

class Car {
    weak var vehicle: Vehicle?
    var id: String
    
    init(vehicle: Vehicle?, id: String) {
        self.vehicle = vehicle
        self.id = id
        print("Car created")
    }
    
    deinit {
        print("Car Deallocated")
    }
}

var car: Car? = Car(vehicle: nil, id: "13920")

var vehicle: Vehicle?  = Vehicle(car: car, id: "192902")
car?.vehicle = vehicle

vehicle = nil
car = nil

