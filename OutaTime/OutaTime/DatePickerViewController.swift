//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Marissa Gonzales on 3/25/20.
//  Copyright © 2020 Joe Veverka. All rights reserved.
//

import UIKit


// Delegate
protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}




class DatePickerViewController: UIViewController {
    
    // declaring delegate
    var delegate: DatePickerDelegate?
    
    
    @IBAction func setDestinationTime(_ sender: Any) {
    }
    
    
    
    @IBAction func saveDateButton(_ sender: Any) {
    }
    
    
    @IBAction func cancelDateButton(_ sender: Any) {
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
