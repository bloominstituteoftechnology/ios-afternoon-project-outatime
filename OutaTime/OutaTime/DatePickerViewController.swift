//
//  DatePickerViewController.swift
//  OutaTime
//
//  Created by Cameron Collins on 3/25/20.
//  Copyright © 2020 Cameron Collins. All rights reserved.
//

import UIKit

protocol DatePickerDelegate {
    func destinationDateWasChosen(date: Date)
}

class DatePickerViewController: UIViewController {

    //Outlets
    @IBOutlet weak var datePicker: UIPickerView!
    
    //Variables
    var delegate: DatePickerDelegate?
    var dates: [[String]] = {
        let months: [String] = Array(0...11).map { String($0) }
        let days: [String] = Array(1...30).map { String($0) }
        let years: [String] = Array(1900...3000).map { String($0) }
        //Combine
        let data: [[String]] = [months, days, years]
        return data
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.delegate = self
        datePicker.dataSource = self
    }
    
    //Actions
    @IBAction func ButtonDone(_ sender: UIButton) {
        #warning("Still need to assign date!")
/*delegate?.destinationDateWasChosen(date: <#T##Date#>)*/
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func ButtonCancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }

}


//Picker Data Source
extension DatePickerViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return dates.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dates[component].count
    }
}

//Picker Delegate
extension DatePickerViewController: UIPickerViewDelegate {
    
    //Set up Visuals
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let title = dates[component][row]
        
        return title
    }
    
    
  
    
}
