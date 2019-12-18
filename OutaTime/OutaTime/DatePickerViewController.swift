//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jorge Alvarez on 12/18/19.
//  Copyright © 2019 Jorge Alvarez. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        print("cancel")
        dismiss(animated: true, completion: nil) // dismisses this view controller
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        print("done")
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    

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
