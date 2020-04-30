//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Sammy Alvarado on 4/27/20.
//  Copyright © 2020 Sammy Alvarado. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    
    // Storyboard Tasks
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
  var dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.dateFormat = "MMM d,yyy"
      formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
      return formatter
  }()
    
    func startTimer() {
        
    }
    
    func reset() {
        
    }
    
    private func updateSpeed(Timer: Timer) {
       
    }
    
    
    var currentSpeed = 0
    var destinationDate: Date?
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            presentTimeLabel.text = dateFormatter.string(from: Date())
            speedLabel.text = String("\(currentSpeed)" + "MPH") // test this out if not change it back
            lastTimeDepartedLabel.text = "--- -- ----"

            // Do any additional setup after loading the view.
        }
    
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let timeVC = segue.destination as! DatePickerViewController
            timeVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.destinationDate = date
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
