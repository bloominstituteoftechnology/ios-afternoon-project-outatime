//
//  DataPickerViewController.swift
//  OutaTime
//
//  Created by Jessie Ann Griffin on 8/12/19.
//  Copyright © 2019 Jessie Griffin. All rights reserved.
//

import UIKit

class DataPickerViewController: UIViewController {

    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelTapped(_ sender: Any) {
    }
    
    @IBAction func doneTapped(_ sender: Any) {
    }
}
