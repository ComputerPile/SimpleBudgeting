//
//  library.swift
//  Simple Budgeting
//
//  Created by Miguel Rodriguez on 1/3/21.
//

import Foundation
import SwiftUI

// library of functions used often

// functions

// dismiss keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
