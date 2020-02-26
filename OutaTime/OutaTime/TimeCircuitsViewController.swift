//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Mark Gerrior on 2/26/20.
//  Copyright © 2020 Mark Gerrior. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    // Lables
    // FIXME: Centering of elements
    @IBOutlet weak var destLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDeptLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var setDestTimeButtonLabel: UIButton!
    @IBOutlet weak var travelBackButtonLabel: UIButton!
    
    // Time Segments
    @IBOutlet weak var destTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastDepartureTime: UILabel!
    @IBOutlet weak var sppedValueLabel: UILabel!
    
    // Button Actions
    @IBAction func travelBackButton(_ sender: Any) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        destLabel.text         = destLabel.text?.uppercased()
        presentTimeLabel.text  = presentTimeLabel.text?.uppercased()
        lastTimeDeptLabel.text = lastTimeDeptLabel.text?.uppercased()
        speedLabel.text        = speedLabel.text?.uppercased()

        setDestTimeButtonLabel.setTitle(setDestTimeButtonLabel.currentTitle?.uppercased(), for: .normal)
        travelBackButtonLabel.setTitle(travelBackButtonLabel.currentTitle?.uppercased(), for: .normal)
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
