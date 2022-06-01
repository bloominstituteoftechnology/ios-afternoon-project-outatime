//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Waseem Idelbi on 5/30/22.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    
//MARK: - Properties
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .short
        return dateFormatter
    }
    var currentSpeed = 0
    
//MARK: - IBOutlets
    @IBOutlet weak var destinationLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
//MARK: - IBActions
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        
    }
    
//MARK: - Methods
    // Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    // Updating views
    func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }

}
