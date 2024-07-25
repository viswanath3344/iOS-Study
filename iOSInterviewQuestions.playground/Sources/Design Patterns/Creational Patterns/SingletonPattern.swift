import Foundation
class Singleton {
   static let shared = Singleton()
    private init() {}
}

func main() {
    Singleton.shared
}

main()

