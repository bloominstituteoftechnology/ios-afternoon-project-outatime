//
//  DatePickerViewController.swift
//  OutOfTime
//
//  Created by beth on 1/29/20.
//  Copyright © 2020 elizabeth wingate. All rights reserved.


import UIKit

protocol DatePickerDelegate {
    func DestinationWasChosen(_ date: Date)
}


class DatePickerViewController: UIViewController {
    
 @IBOutlet weak var destinationTimePicker: UIDatePicker!
    
    var delegate: DatePickerDelegate?
    var date: Date?
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
    
    @IBAction func cancelButtonPressed(_ sender: Any) {
          dismiss(animated: true, completion: nil)
      }

      @IBAction func doneButtonPressed(_ sender: Any) {
          let date = destinationTimePicker.date
          delegate?.DestinationWasChosen(date)
          dismiss(animated: true, completion: nil)
      }


}

