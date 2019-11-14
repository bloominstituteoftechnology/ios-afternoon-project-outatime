//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Ufuk Türközü on 13.11.19.
//  Copyright © 2019 Ufuk Türközü. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeparted: UILabel!
    @IBOutlet weak var speed: UILabel!
    
    @IBAction func travelBack(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPresentTime()
        // Do any additional setup after loading the view.
    }
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    
    // FORMAT TIME

    func getPresentTime() {
            let formatter = DateFormatter()
            formatter.dateFormat = "MMM dd yyyy"
            let str = formatter.string(from: Date())
            presentTime.text = str
        }
    
    var currentSpeed = {
        
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

