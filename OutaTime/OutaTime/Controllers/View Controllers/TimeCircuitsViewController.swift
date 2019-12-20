//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Lambda_School_loaner_226 on 12/18/19.
//  Copyright © 2019 JamesMcDougall. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController
{

    @IBOutlet weak var destinationTime: UILabel!
    @IBOutlet weak var presentTime: UILabel!
    @IBOutlet weak var lastTimeDeported: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var setDestinationTimeButton: UIButton!
    @IBOutlet weak var travelBackButton: UIButton!
    
    let currentSpeed = 0
    
    let timer = Timer()
    let now = Date()
    
    
    
    
    var dateFormatter: DateFormatter
    {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd YYYY hh : ss"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        destinationTime.text = "--- -- ----"
        presentTime.text = String("\(Date())")
        lastTimeDeported.text = "--- -- -----"
        speed.text = ("\(currentSpeed) MPH")
        
    }
    
    @IBAction func travelBackButtonTapped(_ sender: Any)
    {
        
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

extension TimeCircuitsViewController: DatePickerDelegate
{
    
}
