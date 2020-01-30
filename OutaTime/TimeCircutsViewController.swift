//
//  TimeCircutsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Losaner_256 on 1/29/20.
//  Copyright © 2020 Benglobal Creative. All rights reserved.
//

import UIKit

class TimeCircutsViewController: UIViewController {    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateSpeed(timer:)
    }
    
    var currentSpeed = 0
    
    var destinationDate: Date?
    
    var timer = Timer()
    
    let now = Date()
    
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    func dateString(date: Date) -> String {
        let timeRightNow = dateFormatter.string(from: now)
        return timeRightNow
        
    }
    
    func showAlert(){
        let alert = 
    }
    
    
    func updateViews() {
        presentTimeLabel.text = dateString(date: now)
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()

        // Do any additional setup after loading the view.
    }
    
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TimeCircutsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destinationDate.text = dateFormatter.string(from: date)
}

}
