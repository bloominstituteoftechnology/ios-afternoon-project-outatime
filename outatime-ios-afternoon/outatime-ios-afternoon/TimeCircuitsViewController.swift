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
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackButtonPressed(_ sender: Any) {
        
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(_ destinationDate: Date) {
        
    }
}
