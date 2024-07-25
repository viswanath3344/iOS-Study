import Foundation

// DIP: High level modules should not depends on Low level modules. Both should depends on abstraction. Abstraction should't be depends on details. Details should depends on details.


struct User {
    let name: String
    let age: Int
}

protocol UserDataProvider {
    func getDetails() -> User
}

/// Low level modules
class LocalUserDataProvider : UserDataProvider {
    func getDetails() -> User {
        print("Local user Data")
        return User(name: "Local", age: 37)
    }
}

/// Low level Modules
class RemoteUserDataProvider: UserDataProvider {
    func getDetails() -> User{
        print("Remote user data provider")
        return User(name: "Remote", age: 37)
    }
}

/// High level module
class UserDataManager: UserDataProvider {
    
    let userDataProvider: UserDataProvider
    
    init(userDataProvider: UserDataProvider) {
        self.userDataProvider = userDataProvider
    }
    
    func getDetails() -> User {
        userDataProvider.getDetails()
    }
}


func main() {
    let localUserManager = UserDataManager(userDataProvider: LocalUserDataProvider())
    print(localUserManager.getDetails()
    
    let remoteUserManager = UserDataManager(userDataProvider: RemoteUserDataProvider())
    print(remoteUserManager.getDetails())
}

main()

