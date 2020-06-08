//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Cora Jacobson on 6/8/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }
    
    var speed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTimeLabel.text = "--- -- ----"
        presentTimeLabel.text = dateFormatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = "\(speed) MPH"
        
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
        
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "modalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
