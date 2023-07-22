//
//  ImageView.swift
//  PhotoOfTheDay
//
//  Created by Kamran Iqbal on 7/19/23.
//

import SwiftUI

struct ImageView: View {
    
    var imageURL: String
    var imageTitle: String
    var imageDate: String
    var imageExplanation: String
    
    var body: some View {
        VStack {
            Text(imageTitle)
                .font(.subheadline)
                .fontWeight(.semibold)
            AsyncImage(url: URL(string: imageURL)!){image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
            }placeholder: {
                ProgressView()
            }
            .padding()
            
            HStack{

                Text(imageDate)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
            }
            
            Spacer()
            
            Text(imageExplanation)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.caption)
            
        
        }
        .padding()
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(imageURL: "https://apod.nasa.gov/apod/image/2307/Chandrayaan3_Suresh_960.jpg", imageTitle: "Chandrayaan-3 Launches to the Moon", imageDate: "2023-07-19", imageExplanation: "Birds don't fly this high.  Airplanes don't go this fast.  The Statue of Liberty weighs less.  No species other than human can even comprehend what is going on, nor could any human just a millennium ago. The launch of a rocket bound for space is an event that inspires awe and challenges description.  Pictured here last week, the Indian Space Research Organization's  LVM3 rocket blasted off from the Satish Dhawan Space Centre on Sriharikota Island, India.  From a standing start, the 600,000+ kilogram rocket ship lifted the massive Chandrayaan-3 off the Earth. The Chandrayaan-3 mission is scheduled to reach the Moon in late August and land a robotic rover near the lunar South Pole. Rockets bound for space are now launched from somewhere on Earth every few days.")
    }
}
