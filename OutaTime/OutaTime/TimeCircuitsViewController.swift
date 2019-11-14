//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_218 on 11/13/19.
//  Copyright © 2019 Lambda_School_Loaner_218. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    var speed = 0
    
    @IBOutlet weak var DestinationLabel: UILabel!
    
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var travelBack: UIButton!
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    
    
    
    func presentTime(){
        presentTimeLabel.text = dateFormatter.string(from: Date())
    }
    
    func departedTime() {
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DatePickerSegue" {
            if let Datepick = segue.destination as? DatePickerViewController {
                Datepick.delegate = self
            }
        }
           
        
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
    
}
