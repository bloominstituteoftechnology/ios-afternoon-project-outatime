//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_259 on 2/18/20.
//  Copyright © 2020 DeVitoC. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet var datePickerView: UIDatePicker!
    
    // MARK: Properties
    var delegate: DatePickerDelegate?
    var date: Date?
    
    
    
    //MARK: IBActions
    @IBAction func doneTapped(_ sender: Any) {
        //let date = datePickerView.date
        delegate?.destinationDateWasChosen(date: datePickerView.date)
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePickerView.datePickerMode = .date
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

