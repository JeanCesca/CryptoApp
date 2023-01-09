//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 09/01/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar {
                        
                    }
                    .hidden()
            }
        }
    }
}
