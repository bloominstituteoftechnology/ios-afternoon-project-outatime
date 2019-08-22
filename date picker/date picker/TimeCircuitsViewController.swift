//
//  TimeCircuitsViewController.swift
//  date picker
//
//  Created by William Chen on 8/21/19.
//  Copyright © 2019 William Chen. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    
    
    @IBOutlet weak var speedLabel: UILabel!
    
    var currentSpeed = 0
    var timer: Timer?
    
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss.SS"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDeparted.text = "--- -- ----"
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func setDestinationTime(_ sender: UIButton) {
        
    }
    
    @IBAction func travelBack(_ sender: UIButton) {
        startTimer()
    }
    
    func startTimer(){
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:) )
    }

    func updateSpeed(timer: Timer){
        if currentSpeed < 88 {
             currentSpeed += 1
             speedLabel.text = String(currentSpeed)
        }else if currentSpeed >= 88 {
            stopTimer()
            lastTimeDeparted.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            currentSpeed = 0
            showAlert()

        }
    }
    
    private func showAlert() {
        guard let presentTime = presentTimeLabel.text else { return }
        let alert = UIAlertController(title: "Time Travel Finished ", message: "You're new date is \(presentTime)", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "OK", style: .destructive, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let timeVC = segue.destination as? DatePickerViewController else { return }
        timeVC.delegate = self
        
        
     
    }
    

}

extension TimeCircuitsViewController : DatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: Date())
    }
    
}
