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

    @IBOutlet weak var destinationTimeCircuit: TimeCircuit!
    @IBOutlet weak var presentTimeCircuit: TimeCircuit!
    @IBOutlet weak var lastDepartedTimeCircuit: TimeCircuit!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBOutlet weak var travelBackButton: UIButton!
    
    
    //MARK: - IBActions
    
    @IBAction func travelBack(_ sender: UIButton) {
        startSpeedIncrementor()
        travelBackButton.disable()
    }
    
    
    //MARK: - Private
    
    typealias MilesPerHour = Int
    
    private var currentSpeed: MilesPerHour = 0 {
        didSet {
            if currentSpeed < 10 {
                speedLabel.text = "0\(currentSpeed) MPH"
            } else {
                speedLabel.text = "\(currentSpeed) MPH"
            }
        }
    }
    
    private func setupViews() {
        presentTimeCircuit.time = Date()
        destinationTimeCircuit.time = nil
        lastDepartedTimeCircuit.time = nil
        travelBackButton.disable()
        startLedBlinker()
    }
    
    // Alert
    
    private func showAlert() {
//        guard let presentTime = presentTimeCircuit.time else { return }
//
//        let alertController = UIAlertController(
//            title: "Time Travel Successful!",
//            message: "Your new date is \(presentTime.longDateShortTime)", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .cancel) { action in
//            self.currentSpeed = 0
//        }
// g
//        alertController.addAction(okAction)
//
//        present(alertController, animated: true)
//
        registerLocalNotification()
    }
    
    func registerLocalNotification() {
        let center = UNUserNotificationCenter.current()
        
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                self.scheduleLocalNotification()
            } else {
                print("User denied authorization to schedule local notifications")
            }
        }
        self.currentSpeed = 0
    }
    
    func scheduleLocalNotification() {
        let center = UNUserNotificationCenter.current()
        guard let presentTime = presentTimeCircuit.time else { return }
        
        let content = UNMutableNotificationContent()
        content.title = "Time travel successful!"
        content.body = "Your new date is \(presentTime.longDateShortTime)"
        content.categoryIdentifier = "alarm"
//        content.userInfo = ["customData": "fizzbuzz"]
        content.sound = .default
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        center.add(request)
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
        } else {
            lastDepartedTimeCircuit.time = presentTimeCircuit.time
            presentTimeCircuit.time = destinationTimeCircuit.time
            destinationTimeCircuit.time = nil
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
        destinationTimeCircuit.ledsOn.toggle()
        presentTimeCircuit.ledsOn.toggle()
        lastDepartedTimeCircuit.ledsOn.toggle()
    }

    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let datePickerVC = segue.destination as? DatePickerViewController {
            datePickerVC.startingDate = presentTimeCircuit.time
            datePickerVC.delegate = self
        }
    }
}


//MARK: - Destination Date Picker Delegate

extension TimeCircuitsViewController: DestinationDatePickerDelegate {
    func destinationWasChosen(_ date: Date) {
        destinationTimeCircuit.time = date
        travelBackButton.enable()
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
}


//MARK: - Button Extension

fileprivate extension UIButton {
    func disable() {
        isEnabled = false
        layer.opacity = 0.5
    }
    
    func enable() {
        isEnabled = true
        layer.opacity = 1.0
    }
}
