//
//  Crypto.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

// MARK: - Crypto
struct Crypto: Codable {
    let status: Status?
    let data: [CryptoData]?
}

// MARK: - Datum
struct CryptoData: Codable{
    let id: Int?
    let name, symbol, slug: String?
    let numMarketPairs: Int?
    let dateAdded: String?
    let tags: [String]?
    let maxSupply: Double?
    let circulatingSupply, totalSupply: Double?
    let platform: Platform?
    let cmcRank: Int?
    let lastUpdated: String?
    let quote: Quote?
}

// MARK: - Platform
struct Platform: Codable {
    let id: Int?
    let name: String?
    let symbol: String?
    let slug: String?
    let tokenAddress: String?
}

// MARK: - Quote
struct Quote: Codable {
    let usd: Usd?
}

// MARK: - Usd
struct Usd: Codable {
    let price, volume24H, percentChange1H, percentChange24H: Double?
    let percentChange7D, marketCap: Double?
    let lastUpdated: String?
}

// MARK: - Status
struct Status: Codable {
    let timestamp: String?
    let errorCode: Int?
    let errorMessage: String?
    let elapsed, creditCount: Int?
}

