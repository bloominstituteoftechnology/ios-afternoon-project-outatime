//
//  DataPickerViewController.swift
//  outtatime
//
//  Created by Lambda_School_Loaner_268 on 1/29/20.
//  Copyright © 2020 Jeremiah. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DataPickerViewController: UIViewController {
    var delegate: DatePickerDelegate?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Done(_ sender: UIBarButtonItem) {
        delegate!.destinationDateWasChosen(date: datePicker.date)
        dismiss(animated: true, completion: nil)
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
