//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bradley Diroff on 2/26/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet var destinationText: UILabel!
    @IBOutlet var presentText: UILabel!
    @IBOutlet var departedText: UILabel!
    @IBOutlet var speedText: UILabel!
    
    
    @IBAction func travelBackTapped(_ sender: UIButton) {
    }
    
    let dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM d yyyy"
         formatter.timeZone = TimeZone(secondsFromGMT: 0)
         return formatter
     }()
    
    var currentSpeed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let timeNow = Date()
        presentText?.text = dateFormatter.string(from: timeNow)
        speedText?.text = "\(currentSpeed) MPH"
        departedText?.text = "--- -- ----"
        
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

extension TimeCircuitsViewController: DatePickerDelegate {
    
    func destinationDateWasChosen(_ date: Date) {
        <#code#>
    }
    
}
