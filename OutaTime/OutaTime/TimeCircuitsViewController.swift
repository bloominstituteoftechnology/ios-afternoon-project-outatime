//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Bhawnish Kumar on 2/26/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationLabel: UILabel!
    
    @IBOutlet weak var presentLabel: UILabel!
    
    @IBOutlet weak var lastTimeLabel: UILabel!
    
    @IBOutlet weak var speedLabel: UILabel!
    
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-mm-yyyy"
        formatter.locale = Locale(identifier: "en_US")
        
       

        return formatter
    }()
    
    var currentSpeed = 0
        

    
    
    override func viewDidLoad() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd,yyyy"

        let CurrentTime: Date = Date()
        print(dateFormatter.string(from: CurrentTime))
        presentLabel.text = "\(dateFormatter.string(from: CurrentTime))"
        
        speedLabel.text = "\(currentSpeed) MPH"
        lastTimeLabel.text = "--- -- ----"
        
        
            
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func destinationButton(_ sender: Any) {
    }
    
    @IBAction func travelButtonTapped(_ sender: Any) {
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

extension TimeCircuitsViewController: DatePickerDelegate {
    func destinationDateWasChosen(date: Date) {
        <#code#>
    }
    
    
}
