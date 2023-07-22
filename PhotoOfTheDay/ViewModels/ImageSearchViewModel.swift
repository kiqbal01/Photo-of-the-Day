//
//  ImageSearcModelView.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/20/23.
//

import Foundation

extension ImageSearchView {
    @MainActor class ImageSearchViewModel: ObservableObject {
        @Published var searchResults = [Welcome]()
        
        func loadViews(searchTerm: String?) async{
            do{
                searchResults = try await NetworkingService().getRequest(api: API_SEARCH, endpoint: "/search", filter: "q", obj: searchTerm!)
                
                
            }catch {
                switch error {
                case NetworkingError.invalidURL:
                    print("Invalid URL")
                case NetworkingError.invalidResponse:
                    print("Invalid Response")
                case NetworkingError.invalidData:
                    print("Invalid Data")
                default:
                    print("Unexpected Error")
                }
                
            }
        }
    }
}
