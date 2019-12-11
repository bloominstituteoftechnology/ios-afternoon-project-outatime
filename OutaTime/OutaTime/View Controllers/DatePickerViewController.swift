//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by David Wright on 12/10/19.
//  Copyright © 2019 David Wright. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    // MARK: - IBOutlets

    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties

    var delegate: DatePickerDelegate?
    
    // MARK: - IBActions
    
    @IBAction func doneButtonTapped(_ sender: UIButton) {
        delegate?.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
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
