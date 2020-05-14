//
//  SwiftUIView.swift
//  Location
//
//  Created by Soichiro Kuroyanagi on 2020/03/18.
//  Copyright © 2020 TSUBUSAKI AKIHIRO. All rights reserved.
//

import SwiftUI
import CoreLocation
var selection2 = 0

struct SwiftUIView: View {
    
    


    @EnvironmentObject private var userData: UserData
   // let userData = UserData()
@State var showingDetail = false
   @State  var selection = 0    // ここで設定した値(3)が初期選択値になる
    
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
   
    
    var body: some View {
        
        

        
        VStack {
            

            
            /*
            NavigationView{
        NavigationLink(destination: //MapTest(coordinate: landmarkData[7].locationCoordinate)){
             Sample()){
             Text("MAPd")
                }
         }*/
            MapTest(coordinate:
        //        self.locationObserver.location.coordinate
        landmarkData[selection].locationCoordinate
            ).edgesIgnoringSafeArea(.vertical)
        
            Button(action: {self.showingDetail.toggle()}){
                Text("Go!")
               
                   .font(.largeTitle)
                     .foregroundColor(Color.white)
                    .frame(width:200, height:4)
                
                    //.border(Color.blue, width:2)
                 } .padding(.all)
                            .background(Color.blue)
                 .cornerRadius(30)
                .sheet(isPresented: $showingDetail){
                    // Sample()
                    Detail(num: self.selection)
                  //  LandmarkDetail(landmark: self.userData.landmarks[1])
                    // .environmentObject(self.userData)
                    
                 }
 

            HStack{
                
   
        //Text("Go!")
        ////////////////
    
                ////////////
                Spacer()
        
         Picker(selection: $selection, label:
         
         Text("選択"))
         {
                       ForEach(0 ..< 32) { num in
                        
                        HStack{
                            
                            if landmarkData[num].isFavorite{
                            Image("sirohuku2") .resizable()
                            .frame(width: 30, height: 30)
                            }else{
                                Image("cafe") .resizable()
                                .frame(width: 30, height: 30)
                            }
                         Text(landmarkData[num].name).frame(maxWidth: .infinity, alignment: .leading)
                        }// .tag()の指定は不要
                       }
                   }.labelsHidden()
                   //.frame(width: 400)
                 
                  // Text("選択値：\(selection)")
               //selection に選択した番号が入る
         
    }
            
            
            
        }
}
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}

