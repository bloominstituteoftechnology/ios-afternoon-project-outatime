//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bronson Mullens on 4/28/20.
//  Copyright © 2020 Bronson Mullens. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var mphLabel: UILabel!
    
    // MARK: - IBActions
    @IBAction func travelBackButtonPressed(_ sender: Any) {
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        return formatter
    }()
    
    var currentSpeed: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presentTimeLabel.text = dateFormatter.string(from: Date())
        mphLabel.text = String(currentSpeed)
        
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

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
    }
    
}
