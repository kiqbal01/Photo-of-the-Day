//
//  ViewModel.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/19/23.
//

import Foundation


extension APODView {
    @MainActor class APODViewModel: ObservableObject {
        
        @Published var newImage: [ImageOfDay] = []
        @Published var selectDate: String = ""
        @Published var myDate = Date()
 
        
        var formattedDate: String {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-d"
                return dateFormatter.string(from: myDate)
            }
        
        func loadViews(date: String?) async{
            do{
         
                newImage = try await NetworkingService().getRequest(api: API_APOD, endpoint: "/planetary/apod", filter: "date", queryItem: ["api_key": API_KEY], obj: date!)
              
                
            }catch NetworkingError.invalidURL{
                print("invalid URL")
            }catch NetworkingError.invalidResponse{
                print("invalid Response")
            }catch NetworkingError.invalidData{
                print("invalid Data") 
            }catch {
                print("Unexpected Error")
            }
        }
        
        
    }
}


