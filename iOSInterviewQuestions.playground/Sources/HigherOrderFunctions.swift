import Foundation

struct User {
    let name: String
    let gender: String
    let phoneNumber: String?
}

let users = [
  User(name: "Viswa", gender: "Male", phoneNumber: "9700800307"),
  User(name: "Ravs", gender: "Female", phoneNumber: nil)
]

// Map
print(users.map { $0.gender})

// compact map
print(users.compactMap({ $0.phoneNumber}))

print(users.MyMap({ $0.gender }))
print(users.myCompactMap({ $0.phoneNumber}))

print(users.filter({ $0.gender == "Female"}))
print(users.myFilter({ $0.gender == "Female"}))

let values = [2,30,40,20]

let result = values.reduce(0) { partialResult, nextValue in
    return partialResult + nextValue
}
print(result)

let result1 = values.reduce(0, {$0 + $1})
print(result1)

let result2 = values.reduce(0, +)
print(result2)

let result3 = values.myReduce(0, +)
print(result3)

extension Collection {
     public func MyMap<T>(_ transform: (Element) throws -> T) rethrows -> [T] {
        var results = [T]()
        
        for item in self {
            results.append(try transform(item))
        }
        
        return results
    }
    
    public func myCompactMap <T> (_ transform: (Element) throws -> T?) rethrows -> [T] {
        var results = [T]()
        
        for item in self {
            if let value =  try transform(item) {
                results.append(value)
            }
        }
        
        return results
    }
    
    public func myFilter(_ isIncluded: (Element) throws -> Bool) rethrows -> [Element] {
        var results = [Element]()
        
        for item in self {
            if try isIncluded(item) {
                results.append(item)
            }
        }
        
        return results
    }
    
    public func myReduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result {
        var initialValue = initialResult
        
        for item in self {
            initialValue = try nextPartialResult(initialValue, item)
        }
        
        return initialValue
    }
}
