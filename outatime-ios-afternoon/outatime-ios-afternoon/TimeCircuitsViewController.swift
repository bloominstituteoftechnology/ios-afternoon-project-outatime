//
//  TimeCircuitsViewController.swift
//  outatime-ios-afternoon
//
//  Created by Alex Shillingford on 6/12/19.
//  Copyright © 2019 Alex Shillingford. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed: Double = 0.0
    var timer: Timer?
    var datePickerVC = DatePickerViewController()
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        presentTimeLabel.text = dateFormatter.string(from: Date())
    }
    
    @IBAction func travelBackButtonPressed(_ sender: Any) {
        func startTimer() {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
        datePickerVC.delegate = self
    }
    
    func updateViews() {
        
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: destinationDate)
    }
    
    
}
