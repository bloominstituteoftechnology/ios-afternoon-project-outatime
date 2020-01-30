//
//  TimeCircuitViewController.swift
//  outtatime
//
//  Created by Lambda_School_Loaner_268 on 1/29/20.
//  Copyright © 2020 Jeremiah. All rights reserved.
//



import UIKit

class TimeCircuitViewController: UIViewController, DatePickerDelegate {
    
    var timer: Timer = Timer()
    
    var destinationDate: Date?
    func destinationDateWasChosen(date: Date) {
        destinationDate = date
        destinationTime.text = dateFormatter.string(from: date)
        
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:)
)
        
    }
    func resetTimer() {
        timer.invalidate()
    }
    func updateSpeed(timer: Timer) {
       while speed < 88 {
           speed += 1
           speedLabel.text = "\(speed) MPH"
       }
     
        // stopTimer()
        resetTimer()
           lastTimeDeparted.text = presentTime.text
           presentTime.text = destinationTime.text
           speed = 0
           speedLabel.text = "0 MPH"
           showAlert()
       
   }

    
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "Your new date is \(presentTime.text!).", preferredStyle:  .alert)
        let okAction = UIAlertAction(title: "Time Travel Successful", style: .default, handler: nil)
        alert.addAction(okAction)
        
        
        
    }
    
    
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        destinationTime.text = "--- -- ----"
        presentTime.text = dateFormatter.string(from: Date())
        lastTimeDeparted.text = "--- -- ----"
        speedLabel.text = "\(speed) MPH"
        
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
   
    @IBAction func travelBack(_ sender: Any) {
        self.updateSpeed(timer: self.timer)
        
        
        
    }
    
    // Dates are just Format + timeZone
    var dateFormatter: DateFormatter {
        let date = DateFormatter()
        date.dateFormat = "MMM dd yyyy"
        date.timeZone = TimeZone(secondsFromGMT: 0)
        
        return date
        
    }
    
    // MARK: - Navigation

    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // pick which segue
        if segue.identifier == "ModalDestinationDatePickerSegue"
        {
        // the other view controller is the destination and I am the one sending it
            let destinationViewController = segue.destination as! DataPickerViewController
           // The other view delegates delegate property is set to myself.
            destinationViewController.delegate = self
            
        }
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    


}
