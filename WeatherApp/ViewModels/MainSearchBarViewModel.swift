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
    func updateQueriedResults() async throws -> Void {
        objectWillChange.send()
    }
    func fetchQueriedResults(searchQuery: String) async throws -> [QueryLocation] {
        return try await apiCallArray(request: APIRequest.search, location: searchQuery)
    }
}
