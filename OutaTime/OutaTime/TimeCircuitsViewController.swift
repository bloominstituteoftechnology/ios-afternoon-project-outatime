//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Cameron Collins on 3/25/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    //Outlets
    @IBOutlet weak var LabelDestinationTime: UILabel!
    @IBOutlet weak var LabelCurrentTime: UILabel!
    @IBOutlet weak var LabelLastTimeDeparted: UILabel!
    @IBOutlet weak var LabelSpeed: UILabel!
    
    //Variables
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d, yyyy"
        return formatter
    }
    var speed = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLabels()
    }
    
    func viewLabels() {
        LabelCurrentTime.text = dateFormatter.string(from: Date())
        LabelSpeed.text = String(speed) + " MPH"
        LabelLastTimeDeparted.text = "--- -- ----"
    }
    
    //Actions
    @IBAction func ButtonSetDestinationTime(_ sender: UIButton) {
    
    }
    
    @IBAction func ButtonTravelBack(_ sender: UIButton) {
    
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let myIdentifier = segue.identifier else { return }
        
        //Identify Segue
        if myIdentifier == "ModalDestinationDatePickerSegue" {
            
            //Set it's delegate
            if let myDestination = segue.destination as? DatePickerViewController {
                myDestination.delegate = self
            }
        }
    }
}

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        //Nothing
    }
}
