import UIKit

var str = "Hello, playground"

func printTimerFired(timer: Timer) {
    print("The timer has finished")
}

let myTimer = Timer(timeInterval: 3, repeats: true, block: printTimerFired(timer:))
RunLoop.current.add(myTimer, forMode: .default)
