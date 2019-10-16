//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_204 on 10/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
    }
    
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
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
