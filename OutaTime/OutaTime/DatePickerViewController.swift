//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Losaner_256 on 1/29/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit
protocol  DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}
class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
    }
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
    }
    
    var delegate: DatePickerDelegate?
    
    
    
    
    
    
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
