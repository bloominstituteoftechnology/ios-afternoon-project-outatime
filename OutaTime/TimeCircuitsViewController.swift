//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 1/29/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController {
    
    @IBOutlet weak var destinationTickerLabel: UILabel!
    @IBOutlet weak var presentTickerLabel: UILabel!
    @IBOutlet weak var lastDepartedTickerLabel: UILabel!
    @IBOutlet weak var speedTickerLabel: UILabel!
    
      var timer: Timer?
    
     var dateFormatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.dateFormat = "MMM d, yyyy"
          formatter.timeZone = TimeZone(secondsFromGMT: 0)
          return formatter
    }()
    
    func startTimer() {
            timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: )
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTime()
    }
}
    func viewDidLoad() {
        var presentTickerLabel
    }
    
    
    var currentSpeed = 0
    var speedTickerLabel = "\(currentSpeed) MPH"
    let lastDepartedTickerLabel = "___ __ ____"
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "ModalDestinationDatePickerSegue" {
               guard let addDestinationVC = segue.destination as? TimeCircuitsViewController else { return }
                   addDestinationVC.delegate = self
           }
       }
    
    func destinationDateWasChosen() {
        let destinationTickerLabel = dateFormatter.dateFormat
    }
}


extension TimeCircuitsViewController: DatePickerDelegate {
   
    func destinationDateWasChosen(_: Date) {
        
    }
    
    
    
}
