//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Claudia Contreras on 2/18/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//

import UIKit
//MARK: - Protocol
protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet var datePicker: UIDatePicker!
    
    
    //MARK: - Delegate
    var delegate: DatePickerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    //MARK: - IBAction
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        let date = datePicker.date
        delegate?.destinationDateWasChosen(date)
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
