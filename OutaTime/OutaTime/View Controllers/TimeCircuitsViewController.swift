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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        // Do any additional setup after loading the view.
    }
    
    //MARK: - IBActions
    @IBAction func travelBackButton(_ sender: Any) {
        
    }
    var dateformatter: DateFormatter = {
        let formatter = DateFormatter()
        //universal by looking at formats
        formatter.dateFormat = "HH:mm"
        formatter.timeZone = TimeZone.current
        return formatter
    }()
    
    func updateViews() {
        let date = Date()
        presMonthLabel.text = date.monthAsString()
        presDayLabel.text = date.dayAsString()
        presYearLabel.text = date.yearAsString()
        presTimeLabel.text = dateformatter.string(from: date)
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
    func destinationDateWasChosen(_: Date) {
        <#code#>
    }
    
    
}
