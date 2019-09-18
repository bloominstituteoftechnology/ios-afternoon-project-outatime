//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by macbook on 9/18/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit


// MARK: - DatePickerDeledate Protocol
protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}



// MARK : - Class
class DatePickerViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    // VIEW DID LOAD
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var delegate: DatePickerDelegate?
    
    
    // MARK: - IBActions
    
    // Done
    // call the delegate method to inform the delegate of the new date chosen by the user. This will inform the delegate of the change, and then dismiss the view
    @IBAction func doneButton(_ sender: UIButton) {
        
        delegate?.destinationDateWasChosen(date: <#T##Date#>)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    // Cancel
    @IBAction func cancelButton(_ sender: UIButton) {
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
