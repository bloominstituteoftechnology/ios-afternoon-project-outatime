//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by B$hady on 6/9/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    
    @IBOutlet weak var travelBacktTapped: UIButton!
    
    
    
    
    private var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter
    }()
    
    var speed: Int = 0
    
    override func viewDidLoad() {
          super.viewDidLoad()
        destinationTimeLabel.text = "--- -- ----"
        presentTimeLabel.text = dateformatter.string(from: Date())
        lastTimeDepartedLabel.text = "--- -- ----"
        speedLabel.text = "\(speed) MPH"
        
        
 var timer: Timer? = nil
    
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: (updateSpeed))
        
    }
        
    func resetTimer() {
            timer?.invalidate()
            timer = nil
        }
        
        func updateSpeed(timer: Timer) {
            if speed < 88 {
                speed += 1
                speedLabel.text = "\(speed) MPH"
            } else {
                resetTimer()
                travelBacktTapped.isEnabled = true
                lastTimeDepartedLabel.text = presentTimeLabel.text
                presentTimeLabel.text = destinationTimeLabel.text
                destinationTimeLabel.text = "--- -- ----"
                speed = 0
                speedLabel.text = "\(speed) MPH"
                let alert = UIAlertController(title: "Time Travel Successful", message: "You have arrived, the date is \(presentTimeLabel.text ?? "unknown")", preferredStyle: .alert)
                let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alert.addAction(okButton)
                present(alert, animated: true, completion: nil)
            }
        }

        // Do any additional setup after loading the view.
        
        presentTimeLabel.text = dateformatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
  

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "modalDestinationDatePickerSegue" {
            if let datePickerVC = segue.destination as? DatePickerViewController {
                datePickerVC.delegate = self
            }
        }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
   

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateformatter.string(from: date)
    }
    
    
}
