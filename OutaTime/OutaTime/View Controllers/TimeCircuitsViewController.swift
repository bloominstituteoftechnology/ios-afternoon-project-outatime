//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Jarren Campos on 2/17/20.
//  Copyright © 2020 Jarren Campos. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    //MARK: -IBOutlets
    
    //Destination
    @IBOutlet var desMonthLabel: UILabel!
    @IBOutlet var desDayLabel: UILabel!
    @IBOutlet var desYearLabel: UILabel!
    @IBOutlet var desTimeLabel: UILabel!
    //Present
    @IBOutlet var presMonthLabel: UILabel!
    @IBOutlet var presDayLabel: UILabel!
    @IBOutlet var presYearLabel: UILabel!
    @IBOutlet var presTimeLabel: UILabel!
    //Last Time Departed
    @IBOutlet var lasMonthLabel: UILabel!
    @IBOutlet var lasDayLabel: UILabel!
    @IBOutlet var lasYearLabel: UILabel!
    @IBOutlet var lasTimeLabel: UILabel!
    //MPH
    @IBOutlet var mphLabel: UILabel!
    
    private var mphSpeed = 0
    
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: updateMPH(timer:))
    }
    
    func resetTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func updateMPH(timer: Timer){
        if mphSpeed < 88 {
            mphSpeed += 1
            mphLabel.text = "\(mphSpeed)"
        } else {
            resetTimer()
            lasTimeLabel.text = presTimeLabel.text
            presTimeLabel.text = desTimeLabel.text
            mphSpeed = 0
            showAlert()
        }
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Successful", message: "The date now is \(desMonthLabel.text!) \(desDayLabel.text!), \(desYearLabel.text!) \(desTimeLabel.text!)", preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
        let subview = (alert.view.subviews.first?.subviews.first?.subviews.first!)! as UIView
        subview.backgroundColor = UIColor.red
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func travelBackButton(_ sender: Any) {
        startTimer()
        
        lasTimeLabel.text = desTimeLabel.text
        lasDayLabel.text = desDayLabel.text
        lasYearLabel.text = desYearLabel.text
        lasMonthLabel.text = desMonthLabel.text
    }
    var dateformatterM: DateFormatter = {
        let formatter = DateFormatter()
        //universal by looking at formats
        formatter.setLocalizedDateFormatFromTemplate("MMM")
        return formatter
    }()
    var dateformatterD: DateFormatter = {
        let formatter = DateFormatter()
        //universal by looking at formats
        formatter.setLocalizedDateFormatFromTemplate("dd")
        return formatter
    }()
    var dateformatterY: DateFormatter = {
        let formatter = DateFormatter()
        //universal by looking at formats
        formatter.setLocalizedDateFormatFromTemplate("YYY")
        return formatter
    }()
    var dateformatterT: DateFormatter = {
        let formatter = DateFormatter()
        //universal by looking at formats
        formatter.setLocalizedDateFormatFromTemplate("HH:mm")
        return formatter
    }()
    func updateViews() {
        let date = Date()
        presMonthLabel.text = date.monthAsString()
        presDayLabel.text = date.dayAsString()
        presYearLabel.text = date.yearAsString()
        presTimeLabel.text = date.timeAsString()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue"{
            if let AddVC = segue.destination as? DatePickerViewController{
                AddVC.delegate = self
            }
        }
    }
}
//getting the current date/time
extension Date {
    func monthAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("MMM")
        return df.string(from: self)
    }
    func dayAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("dd")
        return df.string(from: self)
    }
    func yearAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("YYYY")
        return df.string(from: self)
    }
    func timeAsString() -> String {
        let df = DateFormatter()
        df.setLocalizedDateFormatFromTemplate("HH:mm")
        return df.string(from: self)
    }
}

extension TimeCircuitsViewController: DatePickerDelegate{
    
    func destinationDateWasChosen(_ date: Date) {
        desTimeLabel.text = dateformatterT.string(from: date)
        desMonthLabel.text = dateformatterM.string(from: date)
        desDayLabel.text = dateformatterD.string(from: date)
        desYearLabel.text = dateformatterY.string(from: date)
    }
    
    
}
