//
//  CoinImageViewModel.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 09/01/23.
//

import Foundation
import SwiftUI
import Combine

class CoinImageViewModel: ObservableObject {
    
    @Published var image: UIImage? = nil
    @Published var isLoading: Bool = false
    
    private let coin: CoinModel
    private let imageService: CoinImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(coin: CoinModel) {
        self.imageService = CoinImageService(coin: coin)
        self.coin = coin
        self.isLoading = true
        self.addSubscribers()
    }
    
    private func addSubscribers() {
        imageService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)

    }
}
