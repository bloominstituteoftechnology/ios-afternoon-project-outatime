//
//  MainViewController.swift
//  Outatime
//
//  Created by Jake Connerly on 6/12/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    //
    // MARK: - Outlets and Properties
    //
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        return formatter
    }()
    
    var speed = 0
    var defaultLastDeparted = "--- -- ----"
    
    //
    // MARK: - View LifeCycle and IBActions
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
    }
    
    //
    // MARK: - Methods
    //
    
    func updateViews() {
        let formattedDate = dateFormatter.string(from: Date())
        presentTimeLabel.text = formattedDate
        speedLabel.text = "\(speed) MPH"

    }
    
    func string(from time: Date) -> String {
        let date = Date()
        
        return dateFormatter.string(from: date)
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

//
// MARK: - Extensions
//

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(for date: Date) {
        <#code#>
    }
    
    
}
