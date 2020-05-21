//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ian Becker on 5/20/20.
//  Copyright © 2020 Ian Becker. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0
    
    private func updateViews() {
        let currentDate = dateFormatter.dateFormat
        presentTime.text = currentDate
        speed.text = String("\(currentSpeed) MPH")
        lastTimeDeparted.text = "--- -- ----"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func travelBack(_ sender: UIButton) {
        func startTimer() {
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: false)
        }
    }
    
    func resetTimer() {
        
    }
    
    @objc func updateSpeed() {
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DatePickerViewController {
        destination.delegate = self
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTime.text = dateFormatter.string(from: destinationDate)
    }
}


