import Foundation


// Interface Segregations Principle. Interfaces should not force you to implement

//MARK: PROBLEM

protocol UnlockPhone {
    func unlockWithPattern()
    func faceUnlock()
    func touchIDUnlock()
}

//MARK: SOLUTION.
// Few phones does't support touch ID. so segregate protocol.
// Interface segregation would also help us to follow LSP.

protocol PatternUnlock {
    func unlockWithPattern()
}

protocol FaceRecognizationUnlock {
    func faceUnlock()
}

protocol touchIDUnlock {
    func touchIDUnlock()
}


