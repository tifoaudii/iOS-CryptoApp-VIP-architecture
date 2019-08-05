//
//  Endpoint.swift
//  CleanSwift
//
//  Created by Tifo Audi Alif Putra on 01/08/19.
//  Copyright © 2019 own. All rights reserved.
//

import Foundation

public typealias HTTPHeaders = [String:String]
public typealias Parameters = [String:Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case puth = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum HTTPTask {
    case request
    case requestWithParams(params: Parameters?, urlParams: Parameters?)
    case requestWithParamsAndHeader(bodyParams: Parameters?, urlParams: Parameters?, headers: HTTPHeaders?)
}

protocol EndpointType {
    var baseUrl: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
}

public enum FailedResponse: Error {
    case apiError
    case invalidEndpoint
    case invalidResponse
    case noData
    case serializationError
}
