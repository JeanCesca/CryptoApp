//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 09/01/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .toolbar {
                        
                    }
                    .hidden()
            }
            .environmentObject(vm)
        }
    }
}
