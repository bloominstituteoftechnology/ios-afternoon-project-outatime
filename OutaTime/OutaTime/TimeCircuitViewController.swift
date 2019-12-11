//
//  TimeCircuitViewController.swift
//  OutaTime
//
//  Created by David Williams on 12/10/19.
//  Copyright © 2019 david williams. All rights reserved.
//

import UIKit

class TimeCircuitViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ---"
        view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    
    var dateFormatter: DateFormatter =  {
           let formatter = DateFormatter()
           formatter.dateFormat = "MMM d,yyyy"
          // formatter.timeZone = TimeZone(secondsFromGMT: 0)
           return formatter
       }()
    // update speedLabel method at end  -  create update speed method!
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false, block: <#T##(Timer) -> Void#>)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? DatePickerViewController {
            vc.delegate = self
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   
    @IBAction func setDestinationTapped(_ sender: UIButton) {
        
    }
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    }
    
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
}
