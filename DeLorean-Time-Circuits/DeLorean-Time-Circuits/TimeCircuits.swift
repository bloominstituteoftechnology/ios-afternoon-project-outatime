//
//  TimeCircuits.swift
//  DeLorean-Time-Circuits
//
//  Created by Kat Milton on 6/12/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import Foundation

protocol TimeCircuitsDelegate: AnyObject {
    func dateDidUpdate(timeRemaining: TimeInterval)
    func timeCircuitComplete()
}

enum TimeCircuitState {
    case started
    case finished
    case reset
}

class TimeCircuit {
    
    weak var delegate: TimeCircuitsDelegate?
    var duration: TimeInterval
    var speed: TimeInterval {
        if let stopDate = stopDate {
            let speed = stopDate.timeIntervalSinceNow
            return speed
        } else {
            return 0
        }
        
    }
        private var timer: Timer?
        private var stopDate: Date?
        private(set) var state: TimeCircuitState
        
        init() {
            timer = nil
            stopDate = nil
            duration = 0
            state = .reset
        }
        
        func startTimer() {
            // Cancel timer before starting new timer
            cancelTimer()
            timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateTimer(timer:))
            stopDate = Date(timeIntervalSinceNow: duration)
            state = .started
        }
        
        func resetTimer() {
            stopDate = nil
            cancelTimer()
            state = .reset
        }
        
        func cancelTimer() {
            // We must invalidate a timer, or it will continue to run even if we
            // start a new timer
            timer?.invalidate()
            timer = nil
        }
        
        private func updateTimer(timer: Timer) {
            
            if let stopDate = stopDate {
                let currentTime = Date()
                if currentTime <= stopDate {
                    // Timer is active, keep counting down
//                    delegate?.dateDidUpdate(timeRemaining: )
                    
                } else {
                    // Timer is finished, reset and stop counting down
                    state = .finished
                    cancelTimer()
                    self.stopDate = nil
                    delegate?.timeCircuitComplete()
                }
            }
        
    }
    
}
