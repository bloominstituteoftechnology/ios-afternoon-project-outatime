//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Gi Pyo Kim on 9/18/19.
//  Copyright © 2019 GIPGIP Studio. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func cancelButtonTabbed(_ sender: UIBarButtonItem) {
    }
    @IBAction func doneButtonTabbed(_ sender: UIBarButtonItem) {
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
