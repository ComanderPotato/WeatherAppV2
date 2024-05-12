//
//  MainSearchViewModel.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import Foundation

class MainSearchBarViewModel: ObservableObject {
    @Published var searchQuery = ""
    @Published var queriedResults: [QueryLocation] = []
    
    init() {
        
    }
    func queryResults() async throws -> Void {
        queriedResults = try await searchQuery(searchQuery: searchQuery)
    }
    func searchQuery(searchQuery: String) async throws -> [QueryLocation] {
        return try await apiCallArray(request: APIRequest.search, location: searchQuery)
    }
}
