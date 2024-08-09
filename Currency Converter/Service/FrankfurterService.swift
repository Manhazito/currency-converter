//
//  FrankfurterService.swift
//  Currency Converter
//
//  Created by Filipe Ramos on 08/08/2024.
//

import Foundation

struct FrankfurterService {
    func fetchRates() async throws -> FrankfurterResponse {
        guard let url = URL(string: ApiConstants.lattestRatesUrl) else { throw NetworkError.badUrl }
        return try await fetchFrankfurterResponse(url: url)
    }
    
    func convert(_ value: String, from: String, to: String) async throws -> FrankfurterResponse {
        guard let url = URL(string: ApiConstants.conversionUrl(value: value, from: from, to: to)) else { throw NetworkError.badUrl }
        return try await fetchFrankfurterResponse(url: url)
    }
    
    private func fetchFrankfurterResponse(url: URL) async throws -> FrankfurterResponse {
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { throw NetworkError.badResponse }
            return try JSONDecoder().decode(FrankfurterResponse.self, from: data)
        } catch {
            debugPrint(error)
            throw NetworkError.decodeError
        }
    }
}
