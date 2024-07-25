import Foundation

/*
  Block operation vs Operation Queue.
 */


func testBlockOperation(){
    print("Execution start")
    BlockOperation {
        for i in 1...5 {
            print(String(i))
        }
    }.start()
    
    
    BlockOperation {
       for i in 6...10 {
           print(String(i))
       }
   }.start()
    
    print("Execution End")
}

/*
 O/P:
 Execution start
 1
 2
 3
 4
 5
 6
 7
 8
 9
 10
 Execution End
 
 MARK: FINDINGS  :  Blocks the current thread where Operation queues does't block the operation.
 We have explicitly call start method for  block operation where as not required for OPQ.
 */

//testBlockOperation()


func testOperationQueue(){
    print("Execution start")
    let operation1 = BlockOperation {
        for i in 1...50 {
            print(String(i))
            
        }
    }
    
    let operation2 = BlockOperation {
       for i in 60...100 {
           print(String(i))
       }
   }
    
    operation1.addDependency(operation2) // First complete the dependency operation then execute the another operation.
    
    let operationQueue = OperationQueue()
    operationQueue.qualityOfService = .background // for provide service important.
    operationQueue.addOperation(operation1)
    
   // operationQueue.maxConcurrentOperationCount = 1 // To notify number of threads to be use for this operations.
    
//    operationQueue.addBarrierBlock {
//        print("I am barrier block") // It executes when the queue finished enqueued operations. Its depends on order you place in the code. If you keep at end then it will be call after all operations are completed.
//    }
//
   
    operationQueue.addOperation(operation2)
    
    
    print("Execution End")
}

testOperationQueue()
