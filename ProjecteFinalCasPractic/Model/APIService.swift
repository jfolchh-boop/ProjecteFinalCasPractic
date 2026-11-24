//
//  APIService.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 24/11/26.
//

import Foundation

struct APIService{

    static func fetchData(stringURL:String) async throws -> [Track]{
        guard let url = URL(string: stringURL) else{
            throw APIError.invalidURL
        }
        
        do{
            let (data, response) =  try await URLSession.shared.data(from: url)
            guard let responseHttp = response as? HTTPURLResponse, (200...299).contains(responseHttp.statusCode) else{
                throw APIError.invalidResponse
            }
            //print(data)
            let searchResponse = try JSONDecoder().decode(SearchResponse.self, from: data)
            return searchResponse.results //traiem l'array de cançons, que está a results dins del JSON de itunes
            //return try JSONDecoder().decode([Track].self, from: data) // así lo teníamos inicialmente
            
        }catch let error as DecodingError{
            throw APIError.decoding(error)
        }catch{
            throw APIError.networkError(error)
        }
        
    }

}
