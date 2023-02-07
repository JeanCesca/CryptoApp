//
//  SettingsView.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 02/02/23.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let defaultURL = URL(string: "https://www.google.com")!
    let youtubeURL = URL(string: "https://www.youtube.com")!
    let coffeeURL = URL(string: "https://www.buymeacoffee.com")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://github.com/JeanCesca")!
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.theme.background
                    .ignoresSafeArea()
                List {
                    settingsSection
                        .listRowBackground(Color.theme.background)
                    developerSection
                        .listRowBackground(Color.theme.background)
                    coinGeckoSection
                        .listRowBackground(Color.theme.background)
                    linkSection
                        .listRowBackground(Color.theme.background)
                }
            }
            .foregroundColor(.blue)
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    XMarkButton(dismiss: _dismiss)
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

extension SettingsView {
    
    private var settingsSection: some View {
        Section {
            HStack(spacing: 20) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("This app was make by following a @SwiftfulThinking course on Youtube.\nIt uses MVVM Architecture, Combine and CoreData :)")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Subscribe on his YouTube 🤠", destination: youtubeURL)
            Link("Support his coffee addiction ☕️", destination: coffeeURL)
        }
        .foregroundColor(.blue)
        .font(.headline)
    }
    
    private var coinGeckoSection: some View {
        Section {
            HStack(spacing: 20) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("The cryptocurrency data that is used ij this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit CoinGecko 🐸", destination: coinGeckoURL)
        }
        .foregroundColor(.blue)
        .font(.headline)
    }
    
    private var developerSection: some View {
        Section {
            HStack(spacing: 20) {
                Image("github")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Text("This app was developed by Jean Cesca.\nThe project benefits from multi-threading, publishers/subscribers, and data persistance.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.theme.accent)
            }
            .padding(.vertical)
            
            Link("Visit my GitHub 💻", destination: personalURL)
        }
        .foregroundColor(.blue)
        .font(.headline)
    }
    
    private var linkSection: some View {
        Section {
            Link("Terms of Service", destination: defaultURL)
            Link("Privacy Policy", destination: defaultURL)
            Link("Company Website", destination: defaultURL)
            Link("Lean More", destination: defaultURL)
        }
    }
}
