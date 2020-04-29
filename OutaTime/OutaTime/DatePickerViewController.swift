//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Ian French on 4/28/20.
//  Copyright © 2020 Ian French. All rights reserved.
//

import UIKit

protocol DatePickerDelegate{
    func destinationDateWasChosen( date: Date)
}



class DatePickerViewController: UIViewController {

  
    var delegate: DatePickerDelegate?
    
    
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
  
    
    
    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    @IBAction func doneTapped(_ sender: Any) {
        let date = datePicker.date
        delegate?.destinationDateWasChosen(date: date)
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
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
