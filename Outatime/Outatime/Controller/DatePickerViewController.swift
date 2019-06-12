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
    
    //
    // MARK: - IBOutlets and Properties
    //
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerDelegate?
    
    var userChosenDate: Date?
    //
    //MARK: - View LifeCycle and IBActions
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDateButtonTapped(_ sender: UIButton) {
        userChosenDate = datePicker.date
        print("user chosen date is \(userChosenDate)")
        delegate?.destinationWasChosen(for: userChosenDate!)
        dismiss(animated: true, completion: nil)
    }
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    //
    // MARK: - Navigation
    //
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        let TimeCircuitVC = segue.destination as! TimeCircuitsViewController
        let userSelectedTime =
        // Pass the selected object to the new view controller.
    }
    */

}
