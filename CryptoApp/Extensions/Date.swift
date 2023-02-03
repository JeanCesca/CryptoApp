//
//  Date.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 02/02/23.
//

import Foundation

extension Date {
    
    // 2021-11-10T14:24:11.849Z
    init(coinGeckString: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let date = formatter.date(from: coinGeckString) ?? Date()
        self.init(timeInterval: 0, since: date)
    }
    
    private var shortFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter
    }
    
    func asShortDateString() -> String {
        return shortFormatter.string(from: self)
    }
}
