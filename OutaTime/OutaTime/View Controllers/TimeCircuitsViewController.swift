//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jordan Christensen on 8/22/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartureLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()
    
    var date = Date()
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    private func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = "\(speed) MPH"
        lastDepartureLabel.text = "--- -- ----"
    }
    
    @IBAction func travelPressed(_ sender: Any) {
        
    }
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SetDestinationModalSegue" {
            
        }
     }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        self.date = date
        updateViews()
    }
    
    
}

