//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Fabiola S on 8/12/19.
//  Copyright © 2019 Fabiola Saga. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        let formattedDate = formatter.string(from: date)
        return formatter
    }()
    
   let date = Date()
   var currentSpeed = 0
   

    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        startTimer()
    }
    
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    func startTimer() {
        
    }
    
    
    
 
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
                
            }
        }
    }
 

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
