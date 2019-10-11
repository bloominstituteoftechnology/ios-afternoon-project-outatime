//
//  DatePickerViewController.swift
//  Out of time
//
//  Created by Alex Thompson on 10/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?

    @IBOutlet weak var datePickerItem: UIDatePicker!
    
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
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
