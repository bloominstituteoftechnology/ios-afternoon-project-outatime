//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Vici Shaweddy on 8/13/19.
//  Copyright © 2019 Vici Shaweddy. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        return formatter
    }()
    
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackButton(_ sender: Any) {
    }
    
    private func updateViews() {
        let date = Date()
        presentTimeLabel.text = dateFormatter.string(from: date).uppercased()
        speedLabel.text = "\(String(currentSpeed)) MPH"
        lastTimeDepartedLabel.text = "___ __ ____"
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
        self.destinationTimeLabel.text = self.dateFormatter.string(from: date).uppercased()
    }

}
