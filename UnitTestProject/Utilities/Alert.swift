//
//  Alert.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 19/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    
    static func showAlert(title: String, message: String, handler: @escaping (_ alert: UIAlertController)->Void) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alert.addAction(ok)
        handler(alert)
    }
    
}
