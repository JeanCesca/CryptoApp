//
//  UIApplication.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 10/01/23.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
