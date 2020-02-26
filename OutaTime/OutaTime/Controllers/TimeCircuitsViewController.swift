//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Karen Rodriguez on 2/25/20.
//  Copyright © 2020 Hector Ledesma. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    let date = Date()
    var speed: UInt = 69
    
    var dateFormatter: DateFormatter {
        get {
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "MMM dd yyyy"
            return dateFormat
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view
            print(dateFormatter.string(from: date))
        presentTimeLabel.text = dateFormatter.string(from: date)
        speedLabel.text = String(speed) + " MPH"
        lastDepartLabel.text = "--- -- ----"
    }
    

    @IBAction func travelBack(_ sender: Any) {
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
