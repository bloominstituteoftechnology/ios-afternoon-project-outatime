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
    var timeRemaining: TimeInterval {
        if let stopDate = stopDate {
            let timeRemaining = stopDate.timeIntervalSinceNow
            return timeRemaining
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
        
        func start() {
            // Cancel timer before starting new timer
            cancelTimer()
            timer = Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: updateTimer(timer:))
            stopDate = Date(timeIntervalSinceNow: duration)
            state = .started
        }
        
        func reset() {
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
                    delegate?.dateDidUpdate(timeRemaining: timeRemaining)
                    
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
