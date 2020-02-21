//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jordan Christensen on 8/22/19.
//  Copyright © 2019 Mazjap Co Technologies. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
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
