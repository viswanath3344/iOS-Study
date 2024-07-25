import Foundation

// Decorater Pattern

protocol IceCream {
    var name: String { get }
    var price: Double { get }
}

class BasicIceCream: IceCream {
    var name: String = "Basic Ice cream"
    var price: Double {
        return 30
    }
}


class MangoIceCream: IceCream {
    let iceCream: IceCream
    
    init(iceCream: IceCream) {
        self.iceCream = iceCream
    }
    
    var name = "Mango Ice cream"
    var price: Double {
        return iceCream.price + 30.0
    }
}

class RichMangoIceCream: IceCream {
    let iceCream: IceCream
    
    init(iceCream: IceCream) {
        self.iceCream = iceCream
    }
    
    var name = "Rich Mango Ice cream"
    var price: Double {
        return iceCream.price + 20.0
    }
}


func main () {
    let mangoIceCream = MangoIceCream(iceCream: BasicIceCream())
    
    let richMangoIceCream = RichMangoIceCream(iceCream: mangoIceCream)
    print(richMangoIceCream.name)
    print(richMangoIceCream.price)
    
}

main()


protocol Message {
    func content() -> String
}

class TextMessage: Message {
    let text: String
    
    init(text: String) {
        self.text = message
    }
    
    func content() -> String {
        return text
    }
}

class Decorator : Message {
    let message: Message
    
    init(message: Message) {
        self.message = message
    }
    
    func content() -> String {
        message.content()
    }
}


class EncryptedDecorator: Decorator {
    override func content() -> String {
       return "Encrypted message"
    }
}

class UppercasedDecorator: Decorator {
    
}
