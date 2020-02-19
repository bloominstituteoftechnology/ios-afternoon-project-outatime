//
//  TimeCircuitViewController.swift
//  OutaTime
//
//  Created by Breena Greek on 2/18/20.
//  Copyright © 2020 Breena Greek. All rights reserved.
//

import UIKit

class TimeCircuitViewController: UIViewController {
    
    
    // MARK IBOutlets
    
    @IBOutlet weak var destinationTimeLabel: UILabel!
    @IBOutlet weak var presentTimeLabel: UILabel!
    @IBOutlet weak var lastTimeDepartedLabel: UILabel!
    @IBOutlet weak var speedLabel: UILabel!
    
    // MARK IBActions
    
    @IBAction func travelBackButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // Properties
    
    private var timer: Timer?
    
    func startTimer() {
        let timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: timer  )
    }
    
    func resetTimer() {
        
    }
    
    func updateSpeed() {
        
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Time Travel Success", message: "You're new date is ", preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    
    self.present(alert, animated: true, completion: nil)
}
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ModalDestinationDatePickerSegue" {
            let addDateVC = segue.destination as! DatePickerViewController
            
            addDateVC.delegate = self
        }
    }
}

extension TimeCircuitViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        
    }
    
    
}

