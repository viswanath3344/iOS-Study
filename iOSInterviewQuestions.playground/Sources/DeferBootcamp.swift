import Foundation

var value = 0
func testDefer() -> Int {
    defer { value = value + 1}
    return value
}

print(testDefer()) // Value should be 0, because defer executes just before ending of scope.
print(value) // Value should be 1, because it has updated before ending the scope of that method.

func testDeferOrder1() {
    print("Item 1")
    
    defer{ print("Item 2") }
    
    print("Item 3")
}

// Expected: Item 1, 3 and 2
print(testDeferOrder1())

func testDeferOrder2() {
    print("Item 1")
    
    defer {print("Item 3")}
    defer {print("Item 4")}
    defer {print("Item 5")}
    
    print("Item 2")
}

// Expected Item 1,2,5,4,3.
print(testDeferOrder2())

func testDeferOrder3() {
    print("Item 1")
    
    defer {print("Item 2")}
    
    defer {
        print("Item 4")
        defer {
            print("Item 3")
        }
    }
    
    defer { print("Item 5")}
    
    print("Item 6")
}

// Expected Item 1, 6, 5, 4, 3, 2
print(testDeferOrder3())
