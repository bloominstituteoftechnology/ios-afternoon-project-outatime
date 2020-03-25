//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Hunter Oppel on 3/25/20.
//  Copyright © 2020 LambdaSchool. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // I may have gone to heavy with the marks but I had been finding myself getting lost in my code, so I'm seeing if this helps
    
    // MARK: - Outlets

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK: Properties
    
    private var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    var speed: Int = 0
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeLabel.text = "--- -- ----"
    }
    
    // MARK: - Actions
    
    @IBAction func tappedTravelBackButton(_ sender: Any) {
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
