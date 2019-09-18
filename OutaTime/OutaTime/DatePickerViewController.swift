//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jesse Ruiz on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - Outlet
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARL: - Action
    
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
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
