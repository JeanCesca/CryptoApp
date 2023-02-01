//
//  MarketDataModel.swift
//  CryptoApp
//
//  Created by Jean Ricardo Cesca on 16/01/23.
//

import Foundation

/*
 URL: https://api.coingecko.com/api/v3/global

 JSON Response:
 {
   "data": {
     "active_cryptocurrencies": 12516,
     "upcoming_icos": 0,
     "ongoing_icos": 49,
     "ended_icos": 3376,
     "markets": 634,
     "total_market_cap": {
       "btc": 48765856.03749534,
       "eth": 659240642.5828657,
       "bits": 48765856037495.336,
       "sats": 4876585603749534
     },
     "total_volume": {
       "btc": 3388590.335640462,
       "eth": 45808617.99288619,
       "ltc": 824399648.4624774,
       "bch": 579620575.0473081,
       "bnb": 238338992.20183095,
       "eos": 68705740166.87579,
       "xrp": 184079377032.951,
       "xlm": 809691048653.9376,
     },
     "market_cap_percentage": {
       "btc": 39.50316382263065,
       "eth": 18.28003675765079,
       "usdt": 6.52278226814522,
       "bnb": 4.76188997168958,
     },
     "market_cap_change_percentage_24h_usd": 0.18336967948257824,
     "updated_at": 1673883591
   }
 }
 */

struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$\(item.value.formattedWithAbbreviations())"
        }
        return ""
    }
    
    var btcDominance: String {
        if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
            return "\(item.value.asPercentString())"
        }
        return ""
    }
}
