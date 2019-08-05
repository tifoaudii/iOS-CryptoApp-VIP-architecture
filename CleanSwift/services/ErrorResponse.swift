//
//  ResponseError.swift
//  CleanSwift
//
//  Created by Ilham Hadi Prabawa on 7/30/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

struct ErrorResponse {
    
    enum ErrorType {
        case urlNotValid
        case unauthorized
        case internalServerError
    }
    
    var statusCode: Int?
    var errorType: ErrorType?
    
    var errorDescription: String {
        get {
            switch errorType! {
            case .urlNotValid:
                return "alamat e ga ketemu cak"
            case .unauthorized:
                return "Umak durung nduwe token cak"
            case .internalServerError:
                return "server e bosok vroh"
            }
        }
    }
}
