//
//  APIRequest.swift
//  PokedexMentoria
//
//  Created by Matheus Rodrigues Araujo on 20/01/23.
//

import Foundation

enum RequestType {
    case get
    case post
    case update
    case delete
}

protocol APIRequest {
    var decoder: JSONDecoder { get }
    var path: String { get }
    var requestType: RequestType { get }
}

extension APIRequest {    
    var decoder: JSONDecoder {
        JSONDecoder()
    }
    
    var requestType: RequestType {
        .get
    }
    
}
