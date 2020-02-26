//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Bhawnish Kumar on 2/26/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit
protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: DatePickerDelegate?
    
    @IBAction func cancelButton(_ sender: Any) {
    }
    
    @IBAction func saveButton(_ sender: Any) {
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
