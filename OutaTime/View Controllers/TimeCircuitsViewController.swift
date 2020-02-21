//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chad Parker on 2/18/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    var speed: Int = 0
    var timer: Timer?
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }

    private func updateSpeed(timer: Timer) {
        if speed < 88 {
            speed += 1
            speedLabel.text = "\(speed) MPH"
        } else {
            resetTimer()
            lastTimeDepartedLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            speed = 0


        }
    }

    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }

    private func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTimeLabel.text!)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)

        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func travelBackButtonPressed(_ sender: UIButton) {
        startTimer()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else { return }
            datePickerVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {

    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
