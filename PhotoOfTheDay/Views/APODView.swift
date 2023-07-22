//
//  APODView.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/20/23.
//

import SwiftUI

struct APODView: View {
    @StateObject private var viewModel = APODViewModel()
    
    private let maximumDate = Date()
    
    var body: some View {
        VStack{
            Text("Astro Photo of the Day")
                .frame(alignment: .center)
                .fontWeight(.bold)
            
            HStack{
                DatePicker("Select Date", selection: $viewModel.myDate, in: ...maximumDate, displayedComponents: [.date] )
                    .datePickerStyle(CompactDatePickerStyle())
               
            }
            .padding()
   
            List{
                ForEach(viewModel.newImage.indices, id: \.self){index in
                    ImageView(imageURL: viewModel.newImage[index].url!, imageTitle: viewModel.newImage[index].title!, imageDate: viewModel.newImage[index].date!, imageExplanation: viewModel.newImage[index].explanation!)
                }
                
            }
            .onChange(of: viewModel.myDate){newDate in
                Task{
                    await viewModel.loadViews(date: viewModel.formattedDate)
                    
                    
                }
                
                
            }
            
            
            
        }
        .task{
            
            await viewModel.loadViews(date: viewModel.formattedDate)
    
        }
        
    }
}

struct APODView_Previews: PreviewProvider {
    static var previews: some View {
        APODView()
    }
}
