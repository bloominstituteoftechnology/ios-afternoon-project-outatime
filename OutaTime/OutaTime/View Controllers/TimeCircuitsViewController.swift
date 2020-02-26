//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jon Bash on 2019-10-16.
//  Copyright © 2019 Jon Bash. All rights reserved.
//

import UIKit
import AVFoundation

class TimeCircuitsViewController: UIViewController {
    
    // MARK: Properties
    
    var speed = 0
    
    var destinationTime: Date = Date() { didSet { updateViews() }}
    var presentTime: Date = Date()
    var lastTimeDeparted: Date?
    
    var timer: Timer?
    
    var dateFormatter = DateFormatter()
    // computed version: (less CPU-efficient, though it probably doesn't matter)
//    var dateformatter: DateFormatter {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "HH:mm:ss.SS"
//        formatter.timeZone = TimeZone(secondsFromGMT: 0)
//        return formatter
//    }
    var nilTimeString = "--- -- ----"
    var speedString: String {
        if speed < 10 {
            return "0\(speed) MPH"
        } else {
            return "\(speed) MPH"
        }
    }
    
    var twinklePlayer: AVAudioPlayer?
    var travelPlayer: AVAudioPlayer?
    
    // MARK: Labels
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartedTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setDestinationButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        // set up date formatter
        dateFormatter.dateFormat = "MMM dd yyyy"
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        // set button styles
        let buttonLineWidth: CGFloat = 1
        let buttonCornerRadius: CGFloat = 10
        let buttonLineColor = UIColor.black.cgColor
        let buttonDisabledColor = UIColor.gray
        
        setDestinationButton.layer.borderWidth = buttonLineWidth
        travelButton.layer.borderWidth = buttonLineWidth
        setDestinationButton.layer.borderColor = buttonLineColor
        travelButton.layer.borderColor = buttonLineColor
        setDestinationButton.layer.cornerCurve = .continuous
        travelButton.layer.cornerCurve = .continuous
        setDestinationButton.layer.cornerRadius = buttonCornerRadius
        travelButton.layer.cornerRadius = buttonCornerRadius
        setDestinationButton.setTitleColor(buttonDisabledColor, for: .disabled)
        travelButton.setTitleColor(buttonDisabledColor, for: .disabled)
        
        // set UI label content to defaults
        presentTimeLabel.text = formatDate(presentTime)
        destinationTimeLabel.text = formatDate(presentTime)
        speedLabel.text = speedString
        lastDepartedTimeLabel.text = nilTimeString
        
        // set up sound
        guard let twinkleURL = Bundle.main.url(forResource: "bttf", withExtension: "m4a") else { return }
        guard let travelURL = Bundle.main.url(forResource: "travel", withExtension: "m4a") else { return }
        
        do {
            twinklePlayer = try AVAudioPlayer(contentsOf: twinkleURL, fileTypeHint: AVFileType.m4a.rawValue)
            travelPlayer = try AVAudioPlayer(contentsOf: travelURL, fileTypeHint: AVFileType.m4a.rawValue)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: Private Methods
    
    private func startTimer() {
        travelButton.isEnabled = false
        setDestinationButton.isEnabled = false
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.1,
            repeats: true,
            block: updateSpeed(_:)
        )
    }
    
    private func updateSpeed(_ timer: Timer) {
        if !(speed >= 88) {
            speed += 1
            speedLabel.text = speedString
        } else {
            didHit88MPH(with: timer)
        }
    }
    
    private func resetTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    private func didHit88MPH(with timer: Timer) {
        resetTimer()
        
        lastTimeDeparted = presentTime
        presentTime = destinationTime
        speed = 0
        
        updateViews()
        
        playTwinkleCue()
        let alert = UIAlertController(
            title: "Time travel successful",
            message: "Your new date is \(formatDate(presentTime)).",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        travelButton.isEnabled = true
        setDestinationButton.isEnabled = true
    }
    
    func playTravelCue() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            guard let player = travelPlayer else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func playTwinkleCue() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            guard let player = twinklePlayer else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // MARK: UI Actions

    @IBAction func setDestinationTapped(_ sender: Any) {}
    
    @IBAction func travelBackTapped(_ sender: Any) {
        playTravelCue()
        startTimer()
    }
    
    private func formatDate(_ dateToFormat: Date) -> String {
        return dateFormatter.string(from: dateToFormat).uppercased()
    }
    
    private func updateViews() {
        presentTimeLabel.text = formatDate(presentTime)
        destinationTimeLabel.text = formatDate(destinationTime)
        if let lastTime = lastTimeDeparted {
            lastDepartedTimeLabel.text = formatDate(lastTime)
        } else {
            lastDepartedTimeLabel.text = nilTimeString
        }
        speedLabel.text = speedString
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController
                else { return }
            
            datePickerVC.delegate = self
            datePickerVC.destinationTime = self.destinationTime
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(_ destinationDate: Date) {
        destinationTime = destinationDate
    }
}
