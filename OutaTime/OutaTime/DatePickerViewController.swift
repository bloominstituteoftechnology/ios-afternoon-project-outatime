//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Nihal Erdal on 3/25/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

protocol DatePickerDelegate{
    
    func destinationDateWasChosen(date: Date)
}


class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var delegate : DatePickerDelegate?
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
  
    
    @IBAction func done(_ sender: UIBarButtonItem) {
    
    delegate?.destinationDateWasChosen(date: datePicker.date)
        
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
