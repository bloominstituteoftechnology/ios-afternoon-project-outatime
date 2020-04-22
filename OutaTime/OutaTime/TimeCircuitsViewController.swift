//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Nonye on 4/22/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
//MARK: OUTLETS
    @IBOutlet weak var destinationTimeLabel: UILabel!
    
    @IBOutlet weak var presentTimeLabel: UILabel!
    
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    
    @IBOutlet weak var mphLabel: UILabel!
//MARK: DATE FORMATTER
    private var dateFormatter: DateFormatter = {
         let formatter = DateFormatter()
         formatter.dateFormat = "MMM dd, yyyy"
         return formatter
     }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
//MARK: ACTIONS
    
    @IBAction func travelBackTapped(_ sender: Any) {
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
