//
//  ListCryptoWorker.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation
import Alamofire

enum FetchResult{
    case success(_ data: [CryptoData])
    case failed(_ error: ErrorResponse)
}

protocol ListCryptoWorkerLogic {
    func fetchCrypto(request: ListCrypto.FetchCrypto.Request?, completion: @escaping(FetchResult) -> Void)
}

class ListCryptoWorker: ListCryptoWorkerLogic {
    
    func fetchCrypto(request: ListCrypto.FetchCrypto.Request?, completion: @escaping (FetchResult) -> Void) {
        
        let url = "cryptocurrency/listings/latest"
        
        Alamofire.request(Constants.BASE_URL.appending(url), method: .get, parameters: [:], encoding: JSONEncoding.default, headers: Service.headers).responseString { (response) in
            
            guard let statusCode = response.response?.statusCode else { return }
            
            if statusCode == 200 {
                do {
                    guard let data = response.data else { return }
                    let decoder = try JSONDecoder().decode(Crypto.self, from: data)
                    guard let cryptos = decoder.data else { return }
                    completion(.success(cryptos))
                }catch {
                    print(error)
                }
            }else {
                if let data = response.data {
                    let jsonErr = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    if let response = jsonErr as? [String: Any] {
                        let statusCode = response["statusCode"] as? Int
                        
                        var customError: ErrorResponse?
                        
                        if statusCode == 404 {
                            customError = ErrorResponse(statusCode: statusCode, errorType: .urlNotValid)
                        }
                        
                        if statusCode == 401 {
                            customError = ErrorResponse(statusCode: statusCode, errorType: .unauthorized)
                        }
                        
                        completion(.failed(customError!))
                    }
                }
                
            }
            
        }

        
    }
}
