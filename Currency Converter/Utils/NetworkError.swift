//
//  NetworkError.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case noConnection
    case badResponse
    case decodeError
    case unknownError
}

extension NetworkError {
    var description: String {
        switch self {
        case .badUrl:
            "The URL used is not valid."
        case .noConnection:
            "Please check your internet connection"
        case .badResponse:
            "The server returned an error"
        case .decodeError:
            "The data in the response is not formatted correctly"
        case .unknownError:
            "An error occurred while requesting the data"
        }
    }
}
