//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Cameron Collins on 3/25/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    //Outlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //Variables
    var delegate: DatePickerDelegate?
    var currentDate = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //Actions
    @IBAction func ButtonDone(_ sender: UIButton) {
        currentDate = datePicker.date
        delegate?.destinationDateWasChosen(date: currentDate)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ButtonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

