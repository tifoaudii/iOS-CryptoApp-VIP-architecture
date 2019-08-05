//
//  ListCryptoModel.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

enum ListCrypto {
    
    enum FetchCrypto {
        
        struct Request {
            
        }
        
        struct Response {
            var cryptos: [CryptoData]
        }
        
        struct ViewModel {
            
            struct DisplayCrypto {
                var name: String
                var symbol: String
                var priceUSD: String
            }

            var displayCryptos: [DisplayCrypto]
        }
    }
}

