// LISCOV substutional principle : Base class objects should be replace with sub type objects without correctness of program.
// Example: It breaks when you inherit from incompatible base class or if you have un implementation of interfaces.

/*
 
 In simpler terms, if you have a piece of code that works with a certain class, it should also work seamlessly when you use a subclass of that class, as long as the subclass adheres to the same behaviors and contracts.
 */

// MARK: PROBLEM
class Shape {
    func area() -> Double {
      fatalError("subclass should be implement area method")
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    override func area() -> Double {
        height * width
    }
}

class Square: Shape {
    let sideLength: Double
    
    init(sideLength: Double) {
        self.sideLength = sideLength
    }
    
    override func area() -> Double {
        sideLength * sideLength
    }
}

let rectangle = Rectangle(width: 100, height: 200)

print(rectangle.area())

let square = Square(sideLength: 100)
print(square.area())


//MARK: SOLUTION:

protocol ShapeProtocol {
    func area() -> Double
}

class RectangleClass: ShapeProtocol {
    let width: Double
    let height: Double
    
    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }
    
    func area() -> Double {
         width * height
    }
}

class SquareClass: ShapeProtocol {
    let sideLength: Double
    
    init(sideLength: Double) {
        self.sideLength = sideLength
    }
    
    func area() -> Double {
         sideLength * sideLength
    }
}


func main() {
    let rectangle = RectangleClass(width: 50, height: 60)
    print(rectangle.area())
    
    let square = Square(sideLength: 20)
    print(square.area())
}

main()
