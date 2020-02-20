//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Lambda_School_loaner_226 on 12/18/19.
//  Copyright © 2019 JamesMcDougall. All rights reserved.
//

import UIKit

protocol DatePickerDelegate
{
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController
{
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var delegate: DatePickerDelegate?

    override func viewDidLoad()
    {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any)
    {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func doneButtonTapped(_ sender: Any)
    {
        
    }
    
}

extension DatePickerViewController: DatePickerDelegate
{
    func destinationDateWasChosen(date: Date) {
        <#code#>
    }
    
    
}
