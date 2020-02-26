//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Shawn Gee on 2/25/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //MARK: - IBOutlets
    
    typealias TimeLabels = (month: UILabel?, day: UILabel?, year: UILabel?, hour: UILabel?, minute: UILabel?)

    // Destination Time Outlets
    @IBOutlet weak var destinationMonthLabel: UILabel!
    @IBOutlet weak var destinationDayLabel: UILabel!
    @IBOutlet weak var destinationYearLabel: UILabel!
    @IBOutlet weak var destinationHourLabel: UILabel!
    @IBOutlet weak var destinationMinuteLabel: UILabel!
    
    lazy var destinationLabels = (
        destinationMonthLabel,
        destinationDayLabel,
        destinationYearLabel,
        destinationHourLabel,
        destinationMinuteLabel)
    
    // Present Time Outlets
    @IBOutlet weak var presentTimeMonthLabel: UILabel!
    @IBOutlet weak var presentTimeDayLabel: UILabel!
    @IBOutlet weak var presentTimeYearLabel: UILabel!
    @IBOutlet weak var presentTimeHourLabel: UILabel!
    @IBOutlet weak var presentTimeMinuteLabel: UILabel!
    
    lazy var presentLabels = (
        presentTimeMonthLabel,
        presentTimeDayLabel,
        presentTimeYearLabel,
        presentTimeHourLabel,
        presentTimeMinuteLabel)
    
    // Last Time Departed Outlets
    @IBOutlet weak var lastDepartedMonthLabel: UILabel!
    @IBOutlet weak var lastDepartedDayLabel: UILabel!
    @IBOutlet weak var lastDepartedYearLabel: UILabel!
    @IBOutlet weak var lastDepartedHourLabel: UILabel!
    @IBOutlet weak var lastDepartedMinuteLabel: UILabel!
    
    lazy var lastDepartedLabels = (
        lastDepartedMonthLabel,
        lastDepartedDayLabel,
        lastDepartedYearLabel,
        lastDepartedHourLabel,
        lastDepartedMinuteLabel)
    
    // LEDs
    @IBOutlet weak var redLedStack: UIStackView!
    @IBOutlet weak var greenLedStack: UIStackView!
    @IBOutlet weak var yellowLedStack: UIStackView!
    
    lazy var ledStacks: [UIStackView] = [redLedStack, greenLedStack, yellowLedStack]
    
    
    // Speed
    @IBOutlet weak var speedLabel: UILabel!
    
    // Buttons
    @IBOutlet weak var travelBackButton: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func travelBack(_ sender: UIButton) {
        startSpeedIncrementor()
    }
    
    
    //MARK: - Private Properties
    
    typealias MilesPerHour = Int
    
    private var currentSpeed: MilesPerHour = 0

    private var presentTime: Date? {
        didSet {
            if let presentTime = presentTime {
                update(presentLabels, withDate: presentTime)
            }
        }
    }
    private var destinationTime: Date? {
        didSet {
            if let destinationTime = destinationTime {
                travelBackButton.isEnabled = true
                travelBackButton.layer.opacity = 1.0
                update(destinationLabels, withDate: destinationTime)
            } else {
                travelBackButton.isEnabled = false
                travelBackButton.layer.opacity = 0.5
                setToEmpty(destinationLabels)
            }
        }
    }
    private var lastDepartedTime: Date? {
        didSet {
            if let lastDepartedTime = lastDepartedTime {
                update(lastDepartedLabels, withDate: lastDepartedTime)
            } else {
                setToEmpty(lastDepartedLabels)
            }
        }
    }
    
    
    //MARK: - Private Methods
    
    // Helper functions
    
    private func update(_ timeLabels: TimeLabels, withDate date: Date) {
        timeLabels.month?.text = date.month
        timeLabels.day?.text = date.day
        timeLabels.year?.text = date.year
        timeLabels.hour?.text = date.hour
        timeLabels.minute?.text = date.minute
    }
    
    private func setToEmpty(_ timeLabels: TimeLabels) {
        timeLabels.month?.text = "---"
        timeLabels.day?.text = "--"
        timeLabels.year?.text = "----"
        timeLabels.hour?.text = "--"
        timeLabels.minute?.text = "--"
    }
    
    private func setupViews() {
        presentTime = Date()
        destinationTime = nil
        lastDepartedTime = nil
        speedLabel.text = "\(currentSpeed) MPH"
        startLedBlinker()
    }
    
    // Alert
    
    private func showAlert() {
        guard let presentTime = presentTime else { return }
        
        let alertController = UIAlertController(
            title: "Time Travel Successful!",
            message: "Your new date is \(presentTime.longDateShortTime)", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    // Speed Incrementor
    
    private var speedIncrementor: Timer?
    
    private func startSpeedIncrementor() {
        speedIncrementor = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(_:))
    }
    
    private func resetSpeedIncrementor() {
        speedIncrementor?.invalidate()
        speedIncrementor = nil
    }

    private func updateSpeed(_ timer: Timer) {
        if currentSpeed < 88 {
            currentSpeed += 1
            speedLabel.text = "\(currentSpeed) MPH"
        } else {
            lastDepartedTime = presentTime
            presentTime = destinationTime
            destinationTime = nil
            currentSpeed = 0
            resetSpeedIncrementor()
            showAlert()
        }
    }
    
    // LED Blinker
    
    private var ledBlinker: Timer?
    
    private func startLedBlinker() {
        ledBlinker = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: blinkLights(_:))
    }
    
    private func blinkLights(_ timer: Timer) {
        ledStacks.forEach {
            if $0.layer.opacity == 1.0 {
                $0.layer.opacity = 0.3
            } else {
                $0.layer.opacity = 1.0
            }
        }
    }
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let datePickerVC = segue.destination as? DatePickerViewController {
            datePickerVC.startingDate = presentTime
            datePickerVC.delegate = self
        }
    }
}


//MARK: - Destination Date Picker Delegate

extension TimeCircuitsViewController: DestinationDatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        destinationTime = date
    }
}


//MARK: - Date Extension

fileprivate extension Date {
    var longDateShortTime: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: self)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y"
        return dateFormatter.string(from: self)
    }
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        return dateFormatter.string(from: self)
    }
    var minute: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: self)
    }
}
