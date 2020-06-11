//
//  DatePickerDelegate.swift
//  Outatime
//
//  Created by John McCants on 6/10/20.
//  Copyright © 2020 John McCants. All rights reserved.
//

import Foundation
import UIKit

protocol DatePickerDelegate: AnyObject {
    func destinationDateWasChosen(date: Date)
}
