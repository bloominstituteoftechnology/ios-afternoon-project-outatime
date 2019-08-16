//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chris Gooley on 8/13/19.
//  Copyright © 2019 Chris Gooley. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0
    
    @IBOutlet weak var destinationTimeTextField: UITextField!
    @IBOutlet weak var presentTimeTextField: UITextField!
    @IBOutlet weak var lastTimeDepartedTextField: UITextField!
    @IBOutlet weak var speedTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    private func updateViews() {
        let currentDate = Date()
        self.presentTimeTextField.text = dateFormatter.string(from: currentDate)
        self.speedTextField.text = "\(String(currentSpeed)) MPH"
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
    }
    
}
