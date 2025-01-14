//
//  mapRequest.swift
//  softeng-iOS
//
//  Created by Alex Siracusa on 4/25/24.
//

import Foundation

extension API {
    static func getMap() async throws -> MapResult {
        let route = "/api/map"
        guard let url = URL(string: WEBSITE_URL + route) else {
            throw RuntimeError("invalid url")
        }
        
        var request = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 1)
        request.httpMethod = "GET"
        
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        do {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 4
            config.timeoutIntervalForResource = 4
            let session = URLSession(configuration: config, delegate: delegate, delegateQueue: OperationQueue.main)
            
            let (data, _) = try await session.data(from: url)
            let map = try JSONDecoder().decode(MapResult.self, from: data)
            print("aa")
            return map
        }
        catch {
            throw error
        }
    }
}





