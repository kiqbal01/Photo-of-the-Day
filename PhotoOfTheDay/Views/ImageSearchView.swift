//
//  ImageSearch.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/20/23.
//

import SwiftUI

struct ImageSearchView: View {
    @StateObject private var viewModel = ImageSearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            
            List{
            
                ForEach(viewModel.searchResults, id:\.self){ result in

                    Section(header: Text("Results")) {
                        ForEach(result.collection?.items ?? [], id: \.self) { item in
                            ForEach(item.data ?? [], id: \.self) { datum in
                                VStack{
                                    Text(datum.title ?? "Unknown Title")
                                        .fontWeight(.bold)
                                    Spacer()
                                    Text(datum.description ?? "Unknown Title")
                                 
                                }
                                
                                
                            }
                        }
                    }
                }
                
                
            }
            .listStyle(.plain)
            .searchable(text: $searchText)
            .onChange(of: searchText) { value in
                Task{
                    if !value.isEmpty && value.count > 3 {
                        await viewModel.loadViews(searchTerm: value)
                    } else{
                        viewModel.searchResults.removeAll()
                    }
                    
                }
                
            }
            .navigationTitle("Search NASA")
            
        }
    }
}

struct ImageSearchView_Previews: PreviewProvider {
    static var previews: some View {
        ImageSearchView()
    }
}
