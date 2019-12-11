//
//  TimeCircuitViewController.swift
//  OutaTime
//
//  Created by David Williams on 12/10/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import UIKit

protocol CountdownDelegate: AnyObject {
    func countdownDidUpdate(timeRemaining: TimeInterval)
    func countdownDidFinish()
}

enum CountdownState {
    case started // countdown is active and counting down
    case finished // countdown has reached 0 and is not active
    case reset // countdown is at initial time value and not active
}

class TimeCircuitViewController: UIViewController {
 weak var delegate: CountdownDelegate?

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed: Int = 0
    private var stopDate: Date?
    private var timer: Timer?
    private var state: CountdownState
     var duration: TimeInterval
    var timeRemaining: TimeInterval {
           if let stopDate = stopDate {
               let timeRemaining = stopDate.timeIntervalSinceNow
               return timeRemaining
           } else {
               return 0
           }
       }
    
    init() {
        timer = nil
        stopDate = nil
        duration = 0
        state = .reset
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ---"
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    
    
    func reset() {
        stopDate = nil
        cancelTimer()
        state = .reset
    }
    
    func cancelTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func updateTimer(timer: Timer) {
        
        if let stopDate = stopDate {
            let currentTime = Date()
            if currentTime <= stopDate {
              
                delegate?.countdownDidUpdate(timeRemaining: timeRemaining)
            } else {
               
                state = .finished
                cancelTimer()
                self.stopDate = nil
                delegate?.countdownDidFinish()
            }
        }
    }
    
    var dateFormatter: DateFormatter =  {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMM d,yyyy"
         
           return formatter
       }()
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false, block: updateTimer(timer:))
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DatePickerViewController {
            vc.delegate = self
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   
    @IBAction func setDestinationTapped(_ sender: UIButton) {
        
    }
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    }
    
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
}
