//
//  class TimeCircuitsViewController  {      TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Mark Poggi on 3/25/20.
//  Copyright © 2020 Mark Poggi. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var DestinationTimeLabel: UILabel!
    @IBOutlet weak var PresentTimeLabel: UILabel!
    @IBOutlet weak var LastTimeDepartedLabel: UILabel!
    @IBOutlet weak var SpeedLabel: UILabel!
    
    
    
    var currentSpeed = 0
    let currentDate = Date(timeIntervalSinceNow: 0)
    var timer = 0
    
    
    
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PresentTimeLabel.text = dateFormatter.string(from: currentDate)
        let speed1 = String(currentSpeed)
        let speed2 = "MPH"
        SpeedLabel.text = "\(speed1) \(speed2)"
        LastTimeDepartedLabel.text = dateFormatter.string(from: currentDate)
        
    }
    
    
    @IBAction func TravelBackButton(_ sender: UIButton) {
        
    }


//    class func startTimer(withTimeInterval interval: .03, repeats: false, block: @escaping (Timer) -> Void) -> Timer
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            
            datePickerVC.delegate = self
        }
    }
}



extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(date: Date) {
        DestinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
