//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by John Holowesko on 12/10/19.
//  Copyright © 2019 John Holowesko. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    // MARK: - IBOutlets
    @IBOutlet var countdownPicker: UIPickerView!
    
    // MARK: - Properties
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: UIButton) {
    }
    
    
}
