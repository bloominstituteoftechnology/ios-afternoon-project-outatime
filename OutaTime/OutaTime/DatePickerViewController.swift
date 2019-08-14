//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Joseph Rogers on 8/13/19.
//  Copyright © 2019 Joe Rogers. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(for date: Date)
}

class DatePickerViewController: UIViewController {

    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(for: datePicker.date)
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
