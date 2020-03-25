//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nihal Erdal on 3/25/20.
//  Copyright © 2020 Nihal Erdal. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTime: UILabel!
    
    @IBOutlet weak var presentTime: UILabel!
    
    @IBOutlet weak var lastTime: UILabel!
    
    
    @IBOutlet weak var speed: UILabel!
    
    
    private var dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentTime : Date = Date()
    
    var currentSpeed = 0
    
    var timer: Timer?
    
   
    
    
    override func viewDidLoad() {
        
        let presenTime = dateFormatter.string(from: currentTime)
        presentTime.text = presenTime
        
        speed.text = "\(currentSpeed) MPH"
        lastTime.text = "--- -- ----" 
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func travelBackTapped(_ sender: Any) {
        
        startTimer()
    }
    
    func startTimer() {
        
    timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:))
    }
    
    func resetTimer(){
        
        timer?.invalidate()
        timer = nil
    }
    
    func updateSpeed(timer: Timer) {
        
        if currentSpeed >= 88 {
            
            lastTime.text = presentTime.text
            presentTime.text = destinationTime.text
            resetTimer()
            currentSpeed = 0
            showAlert()
            
        }else{
            currentSpeed += 1
            speed.text = "\(currentSpeed)"
        }
    }
    
    private func showAlert(){
        
        guard let presentTime = presentTime else {return}
        
        let alert = UIAlertController(title: "Time Travel Successful", message: "You're new date is \(presentTime.text ?? "" ).", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "ModalDestinationDatePickerSegue" {
         guard let datePickerVC = segue.destination as? DatePickerViewController else {return}
            datePickerVC.delegate = self
        }
    }
    

}

extension TimeCircuitsViewController : DatePickerDelegate {
    
    func destinationDateWasChosen(date: Date){
        
        destinationTime.text = dateFormatter.string(from: date)
        
    }
}
