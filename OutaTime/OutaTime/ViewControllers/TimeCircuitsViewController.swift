//
//  TimeCircuitsViewController.swift
//  OutaTime
//
//  Created by Cora Jacobson on 6/8/20.
//  Copyright © 2020 Cora Jacobson. All rights reserved.
//

import UIKit

class TimeCircuitsViewController: UIViewController {

    @IBOutlet weak var destinationTimeTextField: UITextField!

    @IBOutlet weak var presentTimeTextField: UITextField!
    
    @IBOutlet weak var lastTimeDepartedTextField: UITextField!
    
    @IBOutlet weak var speedTextField: UITextField!
    
    @IBAction func travelBackButton(_ sender: Any) {
    }
    
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

}
