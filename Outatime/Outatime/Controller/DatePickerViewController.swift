//
//  UpdateViewController.swift
//  Outatime
//
//  Created by Jake Connerly on 6/12/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationWasChosen(for date: Date)
}

class DatePickerViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func setDateButtonTapped(_ sender: UIButton) {
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
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
