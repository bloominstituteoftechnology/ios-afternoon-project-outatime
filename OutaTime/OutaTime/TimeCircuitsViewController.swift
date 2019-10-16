//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by morse on 10/16/19.
//  Copyright © 2019 morse. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var previousTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    struct PropertyKeys {
        static let segue = "ModalDestinationDatePickerSegue"
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "LLL dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: -25200)
        return formatter
    }
    
    var speed = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presentTimeLabel.text = string(from: Date())
//        speedLabel.text = "\(speed) MPH"
    }
    
    func updateView() {
        
    }
    
    private func string(from date: Date) -> String {
        return dateFormatter.string(from: date).uppercased()
    }
    
    @IBAction func travelTapped(_ sender: Any) {
        updateSpeed()
        
    }
    
    func updateSpeed() {
        
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            self.speedLabel.text = "\(self.speed) MPH"
            self.speed += 1
            if self.speed == 89 {
                timer.invalidate()
                self.updateView()
                self.showAlert()
            }
        }
        self.speed = 0
//        let timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { timer in
//                print(speed)
//                speedLabel.text = "\(speed)"
//                speed += 1
//                if speed == 89 {
//                    timer.invalidate()
//                }
//            }
        
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Timer Finished!", message: "Your countdown is over.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    


}

