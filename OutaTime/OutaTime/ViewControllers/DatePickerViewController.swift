//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Clayton Watkins on 4/27/20.
//  Copyright © 2020 Clayton Watkins. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    //MARK: - Properties
    
    var delegate: DatePickerDelegate?
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        let chosenDate = datePicker.date
            delegate?.destinationDateWasChosen(date: chosenDate)
            dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Helper Functions

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
