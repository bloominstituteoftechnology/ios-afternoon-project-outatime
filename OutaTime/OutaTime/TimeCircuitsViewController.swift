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
    @IBOutlet weak var destTitleLabel: UILabel!
    @IBOutlet weak var presentTimeTitleLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedTitleLabel: UILabel!
    @IBOutlet weak var speedTitleLabel: UILabel!
    @IBOutlet weak var setDestTimeButtonLabel: UIButton!
    @IBOutlet weak var travelBackButtonLabel: UIButton!
    
    // Time Segments
    @IBOutlet weak var destTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastDepartureTimeLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // Button Actions
    @IBAction func travelBackButton(_ sender: Any) {
    }
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()

    // Local Variables
    var destTime = Calendar.current.date(from: DateComponents(calendar: Calendar.current,
                                                              year: 2000,
                                                              month: 1,
                                                              day: 1))!  {
        didSet {
            updateViews()
        }
    }
    
    var presentTime = Date()  {
        didSet {
            updateViews()
        }
    }
    
    var lastTimeDeparted: Date?  {
        didSet {
            updateViews()
        }
    }
    
    var speed = 0 {
        didSet {
            updateViews()
        }
    }
    
    func updateViews() {
        // Destination Time
        destTimeLabel.text = dateFormatter.string(from: destTime)
        
        // Present Time
        presentTimeLabel.text = dateFormatter.string(from: presentTime)
        
        // Last Departure Time
        var departedString = "--- -- ----"
        if let date = lastTimeDeparted {
            departedString = dateFormatter.string(from: date)
        }
        lastDepartureTimeLabel.text = departedString

        // Speed
        speedLabel.text = "\(speed) MPH"
    }
    
    // MARK: - View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        destTitleLabel.text         = destTitleLabel.text?.uppercased()
        presentTimeTitleLabel.text  = presentTimeTitleLabel.text?.uppercased()
        lastTimeDepartedTitleLabel.text = lastTimeDepartedTitleLabel.text?.uppercased()
        speedTitleLabel.text        = speedTitleLabel.text?.uppercased()

        setDestTimeButtonLabel.setTitle(setDestTimeButtonLabel.currentTitle?.uppercased(), for: .normal)
        travelBackButtonLabel.setTitle(travelBackButtonLabel.currentTitle?.uppercased(), for: .normal)

        updateViews()
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            guard let dpVC = segue.destination as? DatePickerViewController else {return}
            dpVC.delegate = self
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        destTime = date
    }
}
