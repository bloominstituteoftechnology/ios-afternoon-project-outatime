//
//  DatePickerDelegate.swift
//  OutaTime
//
//  Created by Chad Rutherford on 11/13/19.
//  Copyright © 2019 Chad Rutherford. All rights reserved.
//

import Foundation

protocol DatePickerDelegate: class {
    func destinationDateWasChosen(_ date: Date)
}
