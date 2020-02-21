//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Chad Parker on 2/18/20.
//  Copyright © 2020 Chad Parker. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    var speed: Int = 0
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyyy"
        return formatter
    }()

    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }

    private func updateViews() {
        presentTimeLabel.text = dateFormatter.string(from: Date())
        speedLabel.text = "\(speed) MPH"
        lastTimeDepartedLabel.text = "--- -- ----"
    }

    @IBAction func travelBackButtonPressed(_ sender: UIButton) {

    }

extension TimeCircuitsViewController: DatePickerDelegate {

    func destinationDateWasChosen(_ date: Date) {
        destinationTimeLabel.text = dateFormatter.string(from: date)
    }
}
