//
//  MainViewController.swift
//  Outatime
//
//  Created by Jake Connerly on 6/12/19.
//  Copyright © 2019 jake connerly. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {
    //
    // MARK: - Outlets and Properties
    //
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, yyy"
        formatter.timeZone = TimeZone.init(secondsFromGMT: 0)
        
        return formatter
    }()
    
    var speed = 0
    
    var defaultLastDeparted = "--- -- ----"
    
    var travelToDate: Date?
    
    //
    // MARK: - View LifeCycle and IBActions
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
        
    }
    
    @IBAction func travelBackButtonTapped(_ sender: UIButton) {
        updateViews()
    }
    
    //
    // MARK: - Methods
    //
    
    func updateViews() {
        let currentFormattedDate = dateFormatter.string(from: Date())
        guard let unwrappedTravelToDate = travelToDate else { return }
        let travelToFormattedDate = dateFormatter.string(from: unwrappedTravelToDate)
        presentTimeLabel.text = currentFormattedDate
        speedLabel.text = "\(speed) MPH"
        destinationTimeLabel.text = travelToFormattedDate

    }
    
    func string(from time: Date) -> String {
        let date = Date()
        
        return dateFormatter.string(from: date)
    }
    
    
    
    //
    // MARK: - Navigation
    //
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let datePickerVC = segue.destination as! DatePickerViewController
        // Pass the selected object to the new view controller.
        datePickerVC.delegate = self
        guard let unwrappedUserChosenDate = datePickerVC.userChosenDate else { return }
        travelToDate = unwrappedUserChosenDate
        print("this is passed over travel to date: \(unwrappedUserChosenDate)")
        
        
    }
    

}

    //
    // MARK: - Extensions
    //

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationWasChosen(for date: Date) {
        updateViews()
    }
}

