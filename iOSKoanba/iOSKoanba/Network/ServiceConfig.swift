//
//  ServiceConfig.swift
//  iOSKoanba
//
//  Created by Irfan Adika on 19/03/21.
//  Copyright © 2021 com. All rights reserved.
//

import Foundation
import Alamofire

private let BASE_URL = ""
private let URL_MOVIE = ""
private let API_KEY = ""

enum ServiceConfig {
    case movie
}

extension ServiceConfig: URLRequestConvertible {
    var baseURL: String {
        let url = BASE_URL
        return url
    }
    
    var path: String {
        switch self {
        case .movie:
            return URL_MOVIE
            
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .movie:
            return .get
        }
    }
    
    func createURLEncoding(url: URL, param: [String: Any] = [:]) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = TimeInterval(30)
            urlRequest = try URLEncoding.default.encode(urlRequest, with: param)
            urlRequest.allHTTPHeaderFields = getHeader(isAuthorization: true)
        } catch {
            print("ERROR ENCODE URL REQUEST")
        }
        
        return urlRequest
    }
    
    func createJSONEncoding(url: URL, param: [String: Any]) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        
        do {
            urlRequest.httpMethod = method.rawValue
            urlRequest.timeoutInterval = TimeInterval(30)
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: param)
            urlRequest.allHTTPHeaderFields = getHeader(isAuthorization: true)
        } catch {
            print("ERROR ENCODE URL REQUEST")
        }
        
        return urlRequest
    }
    
    //MARK : GET HEADER
    func getHeader(isAuthorization: Bool) -> [String:String] {
        let headers: [String:String] = ["Authorization": API_KEY]
        return headers
    }
    
    
    public func asURLRequest() throws -> URLRequest {
        switch self {
            
        case .movie:
            let link = "\(baseURL)\(path)"
            let url = URL(string: link)!
            let param: [String:Any] = [:]
            let urlRequest = createURLEncoding(url: url, param: param)
            return urlRequest
        }
    }
}
