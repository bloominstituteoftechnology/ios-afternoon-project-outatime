//
//  TimeCircuitsViewController.swift
//  Outatime
//
//  Created by Harmony Radley on 3/25/20.
//  Copyright © 2020 Harmony Radley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentLabel: UILabel!
    @IBOutlet weak var departedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var destinationTextField: UITextField!
    @IBOutlet weak var presentTimeTextField: UITextField!
    @IBOutlet weak var lastTimeTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackTapped(_ sender: Any) {
        
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    func textFields() {
        presentTimeTextField.text = dateFormatter.string(from: Date())
        speedTextField.text = "\(speed) MPH"
        lastTimeTextField.text = "--- -- ---"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
