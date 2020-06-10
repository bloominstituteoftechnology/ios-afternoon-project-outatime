//
//  DatePickerViewController.swift
//  outaTime
//
//  Created by Dojo on 6/9/20.
//  Copyright © 2020 Dojo. All rights reserved.
//

import UIKit


protocol DatePickerDelegate {
    func destinationDateWasChosen(_ date: Date)
}

class DatePickerViewController: UIViewController {
    
    @IBOutlet var datePicker: UIPickerView!
    
    @IBAction func abortTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func engageTapped(_ sender: Any) {
        print(travelTime)
        guard let dateItem = dateFormatter.date(from: travelTime) else {
            return}
        delegate?.destinationDateWasChosen(dateItem)
        dismiss(animated: true, completion: nil)
    }
    
    var delegate: DatePickerDelegate?
    
    let months: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    
    let days: [String] = Array(1...31).map { String($0) }
    let years: [String] = Array(1980...2080).map { String($0) }
    
    var travelTime: String {
        let month = datePicker.selectedRow(inComponent: 0)
        let day = datePicker.selectedRow(inComponent: 1)
        let year = datePicker.selectedRow(inComponent: 2)
        
        let stringDate = "\(months[month]) \(days[day]) \(years[year])"
        print(stringDate)
        return stringDate
    }
    
    lazy private var dayPickerData: [[String]] = {
        
        let data: [[String]] = [months, days, years]
        return data
    }()
    
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d yyyy"
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.delegate = self
        datePicker.dataSource = self
        
    }
    
}

extension DatePickerViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return dayPickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return dayPickerData[component].count
    }
}

extension DatePickerViewController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let componentArray = dayPickerData[component]
        let title = componentArray[row]
        
        return title
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
    }

}

