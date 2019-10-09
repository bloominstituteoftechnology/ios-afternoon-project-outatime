//
//  TimeCircuitsViewController.swift
//  Outa time
//
//  Created by Nicolas Rios on 8/12/19.
//  Copyright © 2019 Nicolas Rios. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
       
    @IBOutlet weak var DestinationTimeLabel: UILabel!
       
    @IBOutlet weak var PresentTimeLabel: UILabel!
      
    @IBOutlet weak var LastTimeDepartedLabel: UILabel!
       
    @IBOutlet weak var SpeedLabel: UILabel!


}

    private var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm:ss.SS"
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    
        return formatter
        
  }()



