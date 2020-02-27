//
//  TimeCircuit.swift
//  OutaTime
//
//  Created by Shawn Gee on 2/26/20.
//  Copyright © 2020 Swift Student. All rights reserved.
//

import UIKit

private let onOpacity = Float(1.0)
private let offOpacity = Float(0.3)

class TimeCircuit: UIView {

    //MARK: - IBOutlets
    
    @IBOutlet var contentView: UIView!
    
    // Labels
    @IBOutlet var labels: [UILabel]!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    
    // Leds
    @IBOutlet var separatorLeds: [UIView]!
    @IBOutlet weak var amLed: UIView!
    @IBOutlet weak var pmLed: UIView!
    
    //MARK: - Properties
    
    var time: Date? {
        didSet {
            updateViews()
        }
    }
    
    override var tintColor: UIColor! {
        didSet {
            updateColor()
        }
    }
    
    var ledsOn = true {
        didSet {
            updateSeparatorLeds()
        }
    }
    
    
    //MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    
    //MARK: - Private
    
    private func setup() {
        Bundle.main.loadNibNamed("TimeCircuit", owner: self, options: nil)
        self.addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
        updateColor()
    }
    
    private func updateColor() {
        labels.forEach { $0.textColor = tintColor }
        separatorLeds.forEach { $0.backgroundColor = tintColor }
        amLed.backgroundColor = tintColor
        pmLed.backgroundColor = tintColor
    }
    
    private func updateViews() {
        if let time = time {
            monthLabel.text = time.month
            dayLabel.text = time.day
            yearLabel.text = time.year
            hourLabel.text = time.hour
            minuteLabel.text = time.minute
            
            if time.amPm == "AM" {
                amLed.layer.opacity = onOpacity
                pmLed.layer.opacity = offOpacity
            } else {
                amLed.layer.opacity = offOpacity
                pmLed.layer.opacity = onOpacity
            }
            
        } else {
            monthLabel.text = "---"
            dayLabel.text = "--"
            yearLabel.text = "----"
            hourLabel.text = "--"
            minuteLabel.text = "--"
            
            amLed.layer.opacity = offOpacity
            pmLed.layer.opacity = offOpacity
        }
    }
    
    private func updateSeparatorLeds() {
        guard time != nil else {
            separatorLeds.forEach { $0.layer.opacity = offOpacity}
            return
        }
        separatorLeds.forEach { $0.layer.opacity = ledsOn ? onOpacity : offOpacity }
    }

}


//MARK: - Date Extension

fileprivate extension Date {
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM"
        return dateFormatter.string(from: self)
    }
    var day: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd"
        return dateFormatter.string(from: self)
    }
    var year: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "y"
        return dateFormatter.string(from: self)
    }
    var amPm: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "a"
        return dateFormatter.string(from: self)
    }
    var hour: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh"
        return dateFormatter.string(from: self)
    }
    var minute: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm"
        return dateFormatter.string(from: self)
    }
}
