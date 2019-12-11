//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by David Williams on 12/10/19.
//  Copyright © 2019 david williams. All rights reserved.
//


protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
    
}
import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
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

    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneTapped(_ sender: Any) {
        if let date = datePicker {
          //  self.delegate?.destinationDateWasChosen(date: date)
        }
        dismiss(animated: true, completion: nil)
    }
}
