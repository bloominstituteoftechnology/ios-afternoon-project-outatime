//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jesse Ruiz on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?

    // MARK: - Outlet
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARL: - Action
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let newDate = datePicker else { return }
        let date = Date(newDate)
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
