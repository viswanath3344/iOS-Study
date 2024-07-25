import Foundation

//for value in stride(from: 1, to: 50, by: 2) where value > 20 && value < 40 {
//    print(value)
//}

/*
N - Not running
I - Inactive
A - Active
B - Background
S - Suspended
 
 WillFinishLaunchWithOptions
 didFinishLaunchingWithOptions
 applicationDidBecomeActive
 
 applicationWillResignActive
 applicationDidEnterBackground
 
 applicationWillEnterForeground
 applicationDidBecomeActive
 
 applicationWillTerminate
 */



var startValue = 1
let endValue = 1
repeat {
    print(startValue)
    startValue += 1
}while(startValue < endValue)


while(startValue < endValue ){
    print(startValue)
    startValue += 1
}
