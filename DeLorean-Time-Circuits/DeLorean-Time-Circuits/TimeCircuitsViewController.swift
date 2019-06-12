//
//  ViewController.swift
//  DeLorean-Time-Circuits
//
//  Created by Kat Milton on 6/12/19.
//  Copyright © 2019 Kat Milton. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet var destinationTimeLabel: UILabel!
    @IBOutlet var presentTimeLabel: UILabel!
    @IBOutlet var lastTimeDepartedLabel: UILabel!
    @IBOutlet var speedLabel: UILabel!
    
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0
    
    private let timeCircuit = TimeCircuit()
    
    let date = Date()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentTimeLabel.text = dateFormatter.string(from: date)
        
    }
    
    @IBAction func setDestinationButtonPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func travelBackButtonPressed(_ sender: UIButton) {
        lastTimeDepartedLabel.text = dateFormatter.string(from: date)
    }


}

extension TimeCircuitsViewController: DatePickerDelegate {
    func dateDidSelect(duration: TimeInterval) {
        timeCircuit.duration = duration
    }
    
    
}

