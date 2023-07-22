//
//  ContentView.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/19/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
    
        TabView{
           APODView()
                .tabItem{
                    Text("Home")
                    Image(systemName: "photo.artframe")
                }
            
            ImageSearchView()
                .tabItem{
                    Text("Image Search")
                    Image(systemName: "magnifyingglass")
                }
        }
        
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
