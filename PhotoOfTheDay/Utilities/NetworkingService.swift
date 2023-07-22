//
//  NetworkingService.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/20/23.
//

import Foundation

class NetworkingService{
    
    func getRequest<T: Decodable>(api: String, endpoint: String, filter: String, queryItem: [String: String]? = nil, obj: String) async throws -> [T]{
        
       var results: [T] = []
        
        
        var AllQueryItems = [
            URLQueryItem(name: filter, value: obj)
        ]
        
        if let customerQueryItems = queryItem {
            AllQueryItems.append(contentsOf: customerQueryItems.map {URLQueryItem(name: $0.key, value: $0.value)})
        }
        
        
        var components = URLComponents()
                components.scheme = "https"
                components.host = api
                components.path = endpoint
                components.queryItems = AllQueryItems
        
                
        guard let url = components.url else{
            let invalidURL = components.string
            throw NetworkingError.invalidURL(invalidURL)

        }
        
        let(data, response) = try await URLSession.shared.data(from: url)
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw NetworkingError.invalidResponse
        }
        
        do{
            let string = String(data: data, encoding: .utf8)
            let decoder = JSONDecoder()
            let result = try decoder.decode(T.self, from: data)
            results.append(result)
            
       print("The URL Is: \(String(describing: string))")
       print("The Result Is: \(results)")
        
            
            return results
            
        } catch {
            print("Json Error: \(error)")
            // Access the invalid URL from the error object and print it
            if case let NetworkingError.invalidURL(invalidURL) = error {
                print(invalidURL ?? "default value")
            }
            print("Data: \(String(data: data, encoding: .utf8) ?? "")")
            throw NetworkingError.invalidData
        }
        
    }
}
