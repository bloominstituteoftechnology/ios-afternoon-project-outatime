//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Shawn James on 2/26/20.
//  Copyright © 2020 Shawn James. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - OUTLETS
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// MARK: - ACTIONS
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
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
