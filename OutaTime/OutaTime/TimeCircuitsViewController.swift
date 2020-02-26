//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Wyatt Harrell on 2/26/20.
//  Copyright © 2020 Wyatt Harrell. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let presentDate = Date()
        presentTimeLabel.text = dateFormatter.string(from: presentDate)
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
        destinationTimeLabel.text = "--- -- ----"
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    @IBAction func travelBackButtonTapped(_ sender: Any) {
        startTimer()
    }
    
    func startTimer() {
        let timer = Timer(timeInterval: 0.1, repeats: true, block: updateSpeedLabel())
    }
    
    func updateSpeedLabel() {
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let DatePickerVC = segue.destination as? DatePickerViewController else { return }
            
            DatePickerVC.delegate = self
        }
        
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
