//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_Loaner_241 on 2/18/20.
//  Copyright © 2020 Lambda_School_Loaner_241. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    // Mark: - IBOutlets

    @IBOutlet weak var desTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTime: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func travelBackPressed(_ sender: Any) {
        
    }
    
    

}

// Add 1 IBAction to the TimeCircuitsViewController for when the travel back button is tapped. Wire it up to the touch up inside event of the button in the storyboard. 
