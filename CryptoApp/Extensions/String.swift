//
//  String.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 02/02/23.
//

import Foundation

extension String {
    
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
