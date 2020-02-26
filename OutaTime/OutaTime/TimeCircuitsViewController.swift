//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nichole Davidson on 2/26/20.
//  Copyright © 2020 Nichole Davidson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
   
    @IBOutlet weak var destinationTickerLabel: UILabel!
    @IBOutlet weak var presentTickerLabel: UILabel!
    @IBOutlet weak var lastDepartedTickerLabel: UILabel!
    @IBOutlet weak var speedTickerLabel: UILabel!
    
    var datePickerViewController: DatePickerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM d, yyyy"
            formatter.timeZone = TimeZone(secondsFromGMT: 0)
            return formatter
      }()
    
    //Need to set presentTickerLabel to current date using date formatter
    var currentSpeed = 0
    var speedTickerLabel = "\(currentSpeed) MPH"
    let lastDepartedTickerLabel = "___ __ ____"
    
  
    @IBAction func travelBackButtonTapped(_ sender: Any) {
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ModalDestinationDatePickerSegue" {
                    guard let addDestinationVC = segue.destination as? DatePickerViewController else { return }
                        addDestinationVC.delegate = self
                }
    }
    

}

extension TimeCircuitsViewController: DatePickerDelegate {
    
    
    func destinationDateWasChosen(_: Date) {
//        func string(from duration: TimeInterval) -> String {
//            let date = Date()
//
//            return dateFormatter.string(from: date)
//        }
        
        destinationTickerLabel.text = datePickerViewController?.datePicker.date
    }
    
    
    
}
