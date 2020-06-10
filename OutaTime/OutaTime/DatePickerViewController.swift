//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by B$hady on 6/9/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
   
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
        
    }
    
    
   
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    

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

