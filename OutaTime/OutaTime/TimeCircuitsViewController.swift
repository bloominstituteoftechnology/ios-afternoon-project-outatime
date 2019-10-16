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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func updateView() {
        
    }
    
    @IBAction func travelTapped(_ sender: Any) {
        updateSpeed()
        
    }
    
    func updateSpeed() {
        var speed = 0
        
        Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { timer in
            self.speedLabel.text = "\(speed) MPH"
            speed += 1
            if speed == 89 {
                timer.invalidate()
                self.showAlert()
            }
        }
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

