//
//  ListCryptoPresenter.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

protocol ListCryptoPresentationLogic {
    func presentFetchCrypto(response: ListCrypto.FetchCrypto.Response)
    func presentFailedFetch(error: ErrorResponse)
}

class ListCryptoPresenter: ListCryptoPresentationLogic {
    
    weak var viewController: ListCryptoDisplayLogic?

    func presentFetchCrypto(response: ListCrypto.FetchCrypto.Response) {
        var displayedCryptos: [ListCrypto.FetchCrypto.ViewModel.DisplayCrypto] = []
        for crypto in response.cryptos {
            let name = crypto.name ?? ""
            let symbol = crypto.symbol ?? ""
            let price = "$ \(crypto.quote?.usd?.price ?? 0)"
            let displayCrypto = ListCrypto.FetchCrypto.ViewModel.DisplayCrypto(name: name, symbol: symbol, priceUSD: String(price))
            displayedCryptos.append(displayCrypto)
        }
        
        let viewModel = ListCrypto.FetchCrypto.ViewModel(displayCryptos: displayedCryptos)
        viewController?.displayFetchCrypto(viewModel: viewModel)
    }
    
    func presentFailedFetch(error: ErrorResponse) {
        viewController?.displayFailedFetch(message: error.errorDescription)
    }
    
}
