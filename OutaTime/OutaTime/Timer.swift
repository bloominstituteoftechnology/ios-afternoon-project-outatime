//
//  Timer.swift
//  OutaTime
//
//  Created by Cameron Collins on 3/25/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import Foundation

class TimerController {
    
    var delegate: TimeCircuitsViewController?
    var timer: Timer?
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(time:))
    }
    
    func resetTimer() {
        timer?.invalidate()
        delegate?.speed = 0
        delegate?.updateSpeed()
        
    }
    
    func updateSpeed(time: Timer) {
        
        if let myDelegate = delegate {
            if myDelegate.speed >= 88 {
                resetTimer()
                myDelegate.updateDeparted()
                return
            }
        }
        
        delegate?.speed += 1
        delegate?.updateSpeed()
        print(delegate?.speed ?? "NOTHING")
    }
}
