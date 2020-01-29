//
//  DatePickerViewController.swift
//  OutaTune
//
//  Created by Joshua Rutkowski on 12/10/19.
//  Copyright © 2019 Joshua Rutkowski. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func DestinationWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var destinationTimePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    var date: Date?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTimePicker.setValue(UIColor.white, forKeyPath: "textColor")

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
// MARK: - Actions
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonPressed(_ sender: Any) {
        let date = destinationTimePicker.date
        delegate?.DestinationWasChosen(date)
        dismiss(animated: true, completion: nil)
    }
    
}
