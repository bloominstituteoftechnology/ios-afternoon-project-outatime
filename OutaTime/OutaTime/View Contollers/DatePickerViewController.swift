//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Mark Poggi on 3/25/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationWasChosen( date: Date)

}

class DatePickerViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - Properties
    
    var delegate: DatePickerDelegate?
    
    
     
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 
 
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doneButton(_ sender: Any) {
        delegate?.destinationWasChosen(date: datePicker.date)
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
