//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Ufuk Türközü on 13.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(chosenDate: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePickerView: UIDatePicker!
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneTapped(_ sender: Any) {
        delegate?.destinationDateWasChosen(chosenDate: datePickerView.date)
        dismiss(animated: true, completion: nil)
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
