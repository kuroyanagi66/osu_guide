/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A single row to be displayed in a list of landmarks.
*/

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark

    var body: some View {
        HStack {
            
            if landmark.isFavorite{
            landmark.image
                .resizable()
                .frame(width: 50, height: 50)
            }else{
                Image("cafe").resizable()
                .frame(width: 50, height: 50)
            }
            Text(landmark.name)
            Spacer()

            //お気に入りに星
         //   if landmark.isFavorite {
           //     Image(systemName: "star.fill")
             //       .imageScale(.medium)
               //     .foregroundColor(.yellow)
            //}
        }
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LandmarkRow(landmark: landmarkData[0])
            LandmarkRow(landmark: landmarkData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
