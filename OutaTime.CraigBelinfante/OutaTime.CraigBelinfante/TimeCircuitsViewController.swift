//
//  TimeCircuitsViewController.swift
//  OutaTime.CraigBelinfante
//
//  Created by Craig Belinfante on 6/9/20.
//  Copyright © 2020 Craig Belinfante. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
    var speed = 0
    
    
    @IBOutlet weak var destination: UILabel!
    @IBOutlet weak var present: UILabel!
    @IBOutlet weak var departed: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    
    @IBAction func setButtonTapped(_ sender: Any) {
    }
    @IBAction func travelBackButtonTapped(_ sender: Any) {
    }
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd yyyy"
        return formatter
    }()
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
            present.text = dateFormatter.string(from: Date())

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
