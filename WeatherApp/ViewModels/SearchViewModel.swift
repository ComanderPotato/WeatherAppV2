//
//  SearchViewModel.swift
//  WeatherApp
//
//  Created by Leonna Myers on 12/5/2024.
//

import Foundation

class SearchViewModel: ObservableObject {
    var searchResults: [Location] = []
    @Published var locationNameResultsList: [String] = []
    
    init() {}
    
    func getSearchQueryResults(query: String) async throws {
        Task {
            do {
                self.searchResults = try await searchQuery(searchQuery: query)
            } catch RequestError.invalidURL {
                print("getSearchQueryResults: InvalidURL")
            } catch RequestError.invalidData {
                print("getSearchQueryResults: InvalidData")
            } catch RequestError.invalidResponse {
                print("getSearchQueryResults: InvalidResponse")
            } catch RequestError.bad {
                print("BOO")
            } catch {
                print("getSearchQueryResults: Invalid")
            }
            populateList()
        }
    }
    
    func searchQuery<T: Codable>(searchQuery: String) async throws -> T {
        return try await apiCall(request: APIRequest.search, location: searchQuery)
    }
    
    func populateList() {
        for index in searchResults.indices {
            let item = searchResults[index]
            locationNameResultsList.append(item.name)
        }
    }
}
