//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Hunter Oppel on 3/25/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // I may have gone to heavy with the marks but I had been finding myself getting lost in my code, so I'm seeing if this helps
    
    // MARK: - Outlets

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: Properties
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed: Int = 0
    private var timer: Timer?
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        destinationTimeLabel.text = dateFormatter.string(from: Date())
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeLabel.text = "--- -- ----"
    }
    
    // MARK: - Actions
    
    @IBAction func tappedTravelBackButton(_ sender: Any) {
        startTimer()
    }
    
    
    func startTimer() {
        resetTimer()
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
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
            
            lastTimeLabel.text = presentTimeLabel.text
            presentTimeLabel.text = destinationTimeLabel.text
            
            speed = 0
            speedLabel.text = "\(speed) MPH"
            
            showAlert()
        }
    }
    
    func showAlert() {
        guard let presentTime = presentTimeLabel.text else {return}
        let alert = UIAlertController(title: "Time Travel Successful",
                                      message: "You're new date is \(presentTime))",
                                      preferredStyle: .alert)
    
        let okAction = UIAlertAction(title: "Great Scott!", style: .cancel, handler: nil)
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let datePickerVC = segue.destination as? DatePickerViewController else {
                fatalError("Failed to get the date picker veiw controller.")
            }
            datePickerVC.delegate = self
        }
    }

}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDatewasChosen(date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
