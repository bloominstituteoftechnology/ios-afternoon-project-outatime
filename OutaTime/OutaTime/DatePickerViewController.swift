//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Bronson Mullens on 4/28/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

}

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
