//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Karen Rodriguez on 2/25/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(for date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: Any) {
    }
    
    @IBAction func done(_ sender: Any) {
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
