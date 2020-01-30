//
//  ViewController.swift
//  OutaTIME
//
//  Created by Nick Nguyen on 1/29/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var departedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setTimeButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed = 0 {
        didSet {
             speedLabel.text = "\(currentSpeed) MPH"
        }
    }
     var timer  = Timer()

    @IBAction func setTimeTapped(_ sender: UIButton) {
        //Segue
    }
    
    @IBAction func backTravelTapped(_ sender: UIButton) {
        startTimer()
        travelBackButton.isEnabled = false
       
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateSpeed), userInfo: nil, repeats: true)
    }
    
   @objc func updateSpeed() {
        if currentSpeed < 88 {
            currentSpeed += 1
        } else if currentSpeed == 88 {
            timer.invalidate()
             showAlert()
            travelBackButton.isEnabled = true
            departedTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destTimeLabel.text
        }
    }
    
    private func showAlert() {
        let ac = UIAlertController(title: "Time Travel Successful!", message: "Your new date is \( destTimeLabel.text!)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Okay", style: .destructive, handler: handleOK))
        present(ac, animated: true, completion: nil)
    }
    
    func handleOK(action:UIAlertAction) {
        currentSpeed = 0
        timer.invalidate()
    }
    
   
    
    private func showPresentTime() {
        let now = Date()
        presentTimeLabel.text = dateFormatter.string(from: now)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Helper.segue {
            guard let destVC = segue.destination as? DatePickerViewController else { return }
            destVC.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showPresentTime()
       
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         navigationController?.isToolbarHidden = true
    }

}

extension TimeCircuitsViewController : DatePickerViewControllerDelegate {
    func didChoseDestinationDate(for date: Date) {
        destTimeLabel.text = dateFormatter.string(from: date)
    }
    
    
}
