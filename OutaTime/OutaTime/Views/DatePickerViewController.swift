//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Joel Groomer on 8/13/19.
//  Copyright © 2019 Julltron. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    @IBOutlet weak var pkrDate: UIDatePicker!
    
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

    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
    }
    
}
