//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Austin Potts on 8/21/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit
protocol DatePickerDelegate{
    func destinationWasChosen(_ Date: Date)
}



class DatePickerViewController: UIViewController {

    var delegate: DatePickerDelegate?
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationWasChosen(datePicker.date)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
