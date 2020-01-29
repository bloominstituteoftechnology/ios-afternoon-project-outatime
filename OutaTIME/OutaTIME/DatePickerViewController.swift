//
//  DatePickerViewController.swift
//  OutaTIME
//
//  Created by Nick Nguyen on 1/29/20.
//  Copyright © 2020 Nick Nguyen. All rights reserved.
//

import UIKit

protocol DatePickerViewControllerDelegate : class  {
    func didChoseDestinationDate(for date: Date)
}

class DatePickerViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: DatePickerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpToolBar()
       
    }
    

    private func setUpToolBar() {
        self.navigationController?.isToolbarHidden = false
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDone))
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbarItems = [cancelButton,flexSpace,doneButton]
        self.navigationController?.toolbar.backgroundColor = .clear
       
        setToolbarItems(toolbarItems, animated: true)
    }
    
    @objc func handleDone() {
        delegate?.didChoseDestinationDate(for: datePicker.date)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func handleCancel() {
        navigationController?.popViewController(animated: true)
    }
}
