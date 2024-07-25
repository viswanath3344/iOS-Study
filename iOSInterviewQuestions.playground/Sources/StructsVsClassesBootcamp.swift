import Foundation

// Prints address of structure
func address(o: UnsafeRawPointer)  {
    print(NSString(format: "%p", Int(bitPattern: o)))
}

// Prints address of class
func addressHeap<T: AnyObject>(o: T) {
    print(NSString(format: "%p", unsafeBitCast(o, to: Int.self)))
}

struct Foo: Equatable {
    var foo = 1
}

class Bar:Equatable {
    var bar = 1

    static func == (lhs: Bar, rhs: Bar) -> Bool {
        lhs.bar == rhs.bar
    }
}

var foo1 = Foo()
var foo2 = foo1

address(o: &foo1)
address(o: &foo2)

print(foo1 == foo2)


var bar1 = Bar()
var bar2 = bar1

print(bar1 == bar2)
print(bar1 === bar2)

addressHeap(o: bar1)
addressHeap(o: bar2)

var fooArray1 = [1,2,4,3,5,6,8]
var fooArray2 = fooArray1

address(o: &fooArray1)
address(o: &fooArray2)

withUnsafePointer(to: &fooArray1) { print($0)}
withUnsafePointer(to: &fooArray2) { print($0)}




// Difference between structs and classes

/* 1. Structs are value types, Classes are reference types
   2. Structs since value types, that stores in stack of memory. References types store in Heap of memory.
   3. Structs are faster and classes are slower.
   4. No Thread issue with structs. Concurrency issue with Classes.
   5. Structs have default initialisers, but classes does't have them.
   6. Classes support inheritance , but not in struct, but can achieve using protocols
   7. No deinit method for structs, but have classes.

 */
