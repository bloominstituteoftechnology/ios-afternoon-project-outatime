//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Nonye on 4/22/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
 
    var delegate: DatePickerDelegate?
    
//MARK: OUTLETS
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
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
    func destinationDateWasChosen(_: Date)
}
