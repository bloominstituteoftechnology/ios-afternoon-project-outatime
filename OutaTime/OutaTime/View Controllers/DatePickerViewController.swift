//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Jon Bash on 2019-10-16.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    var delegate: DatePickerDelegate?
    
    @IBOutlet weak var destinationPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelTapped(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func doneTapped(_ sender: UIBarButtonItem) {
        delegate?.destinationDateWasChosen(destinationPicker.date)
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
