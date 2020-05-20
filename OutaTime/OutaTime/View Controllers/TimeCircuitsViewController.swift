//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Richard Gibbs on 5/20/20.
//  Copyright © 2020 Rich Gibbs. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        jan1Label.font = UIFont(name: "digital-7", size: 40)
        may20Label.font = UIFont(name: "digital-7", size: 40)
        dashesLabel.font = UIFont(name: "digital-7", size: 40)
        mphLabel.font = UIFont(name: "digital-7", size: 40)
        
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var jan1Label: UILabel!
    
    @IBOutlet weak var may20Label: UILabel!
    
     @IBOutlet weak var dashesLabel: UILabel!
    
    
    @IBOutlet weak var mphLabel: UILabel!
    
    /*
    
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
