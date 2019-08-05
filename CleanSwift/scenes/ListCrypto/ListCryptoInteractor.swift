//
//  ListCryptoInteractor.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

protocol ListCryptoBussinesLogic {
    func fethCrypto()
}

protocol ListCryptoDataStore {
    var cryptos: [CryptoData]? { get }
}

class ListCryptoInteractor: ListCryptoBussinesLogic, ListCryptoDataStore {
   
    var presenter: ListCryptoPresentationLogic?
    var cryptoWorker = ListCryptoWorker()
    var cryptos: [CryptoData]?
    
    func fethCrypto() {
        cryptoWorker.fetchCrypto(request: nil) { result in
            switch result {
            case .success(let cryptos):
                self.cryptos = cryptos
                let response = ListCrypto.FetchCrypto.Response(cryptos: cryptos)
                self.presenter?.presentFetchCrypto(response: response)
                break
            case .failed(let error):
                self.presenter?.presentFailedFetch(error: error)
                break
            }
        }
        
    }
}
