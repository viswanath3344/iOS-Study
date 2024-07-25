import Foundation
/*
  Prototype pattern uses for deep copy of reference types. As we aware the classes are reference type.
 When you assign a class object to another object, it copies memory, both points to same memory.
 In some cases if you want to duplicate/ clone the object, then we can use this prototype pattern to achieve.
 
 // MARK: Approach
   We will have clone method that return the creation of same class with existing parameters.
   The below example demonstrate We have a Copy Protocol that have clone method and returns the Self.
 
   Point class confirms to Copy protocol and implemented the clone object. If you do using the protocol approach, then you have to force typecast as showed in implicitClone.
 
  In clone method, We create the new instance and return that. It means we will have different memory addresses. 
 
 */


protocol Copy {
    func clone() -> Self
}

class Point: Copy
{
    var x = 0
    var y = 0
    
    init() {}
    
    init(x: Int, y: Int)
    {
        self.x = x
        self.y = y
    }
    
    func clone() -> Self {
        return implicitClone()
    }
    
    private func implicitClone<T>() -> T {
        return Point(x: x, y: y) as! T
    }
}

class Line: CustomStringConvertible, Copy
{
    var start = Point()
    var end = Point()
    
    init(start: Point, end: Point)
    {
        self.start = start
        self.end = end
    }
    
    func clone() -> Self {
        return implicitClone()
    }
    
    private func implicitClone<T>() -> T {
        return Line(start: start.clone(), end: end.clone()) as! T
    }
    
    var description: String {
        return "start Point: \(start.x), \(start.y) :: endpoint: \(end.x), \(end.y) "
    }
}


func main() {
    let line = Line(start: Point(x: 10, y: 20), end: Point(x: 40, y: 50))
    let newLine =  line.clone()
    newLine.start = Point(x: 200, y: 300)
    print(newLine)
    print(line)
}

main()
