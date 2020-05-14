//
//  Detail.swift
//  Landmarks
//
//  Created by Soichiro Kuroyanagi on 2020/03/19.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI
import MapKit


struct Detail: View {
    
    var num: Int
    var body: some View {
        
        VStack{
        
     //   MapView(coordinate: landmarkData[num].locationCoordinate)
       //     .edgesIgnoringSafeArea(.top)
       //     .frame(height: 300)
            
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmarkData[num].name)
                        .font(.title)
                    /*
                    Button(action: {
                        landmarkData[num].landmarks[self.landmarkIndex]
                            .isFavorite.toggle()
                    }) {
                        if landmarkData[num].landmarks[self.landmarkIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    } */
                }
                
                HStack(alignment: .top) {
                    
                    
                    
                    
                    
                    Text(landmarkData[num].park)
                        .font(.subheadline)
                    Spacer()
                    //Text(landmark.state)
                     //   .font(.subheadline)
                                        
                }
                
                /*
                Button(action: {


                    let cleanString = landmarkData[self.num].city
                               
                                     var formattedString = cleanString
                                     let url: NSURL = URL(string: formattedString)! as NSURL

                                     UIApplication.shared.open(url as URL)

                                 }) {
                                     Text("Google Map")
                                   
                                 }*/
                 Button(action: {


                    let cleanString = landmarkData[self.num].state
                
                      var formattedString = cleanString
                      let url: NSURL = URL(string: formattedString)! as NSURL

                      UIApplication.shared.open(url as URL)

                  }) {
                      Text("instagram")
                    
                  }
                
                
            }
            .padding()
            
            Spacer()
            
            
            
        }
    }
}

struct Detail_Previews: PreviewProvider {
    static var previews: some View {
        Detail(num: 1)
    }
}
