//
//  NetworkService.swift
//  IOSOblOpg
//
//  Created by dmu mac 20 on 10/11/2022.
//

import Foundation

class NetworkService {
    func fetchEarthQuake(earthquakeSpan : EQEnum) async throws -> [EarthQuake] {
        guard let earthQuakeURL = URL(string : earthquakeSpan.rawValue)
        else{throw Errors.error1}
        
        let(data, _) = try await URLSession.shared.data(from : earthQuakeURL)
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .millisecondsSince1970
        return try jsonDecoder.decode(Result.self, from: data).features
    }
    struct Response : Decodable{
        var features: [EarthQuake]
    }
}



