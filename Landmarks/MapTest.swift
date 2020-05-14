//
//  MapTest.swift
//  Landmarks
//
//  Created by Soichiro Kuroyanagi on 2020/03/17.
//  Copyright © 2020 Apple. All rights reserved.


import SwiftUI
import MapKit
import CoreLocation

struct MapTest: UIViewRepresentable {
    @EnvironmentObject var userData: UserData
   // @ObservedObject var locationObserver = LocationObserver()
    var showingDetail = false
    
    var coordinate: CLLocationCoordinate2D
    //var coordinate2 = landmarkData[3].locationCoordinate


   func makeUIView(context: Context) -> MKMapView {
    MKMapView(frame: .zero)
    }
    
    
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
///dsvsdsdgdsfsdsfgg

             // uiView.setRegion(region3, animated: true)
    ////sdgsdgdgsdfgsd
        for i in 0..<11{
        
        let coordinate2 = landmarkData[i].locationCoordinate
            
        let sotreName = landmarkData[i].name
        /////
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: coordinate2, span: span)
        
        //
        let annotation = MKPointAnnotation()
        //annotation.coordinate = coordinate
        //let coordinate = CLLocationCoordinate2D(
          //         latitude: 34.011286, longitude: -116.166868)
        annotation.coordinate = coordinate2
        annotation.title = sotreName
        //annotation.subtitle = "Home"
            
                uiView.addAnnotation(annotation)
                
             //   MapView(coordinate: landmarkData[0].locationCoordinate)
           uiView.setRegion(region, animated: true)
             //   .sheet(isePresented: $showingDetail){
            
            
        }
        //////////////////////////
        let annotation = MKPointAnnotation()
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: coordinate, span: span)

        annotation.coordinate = coordinate
     
        uiView.addAnnotation(annotation)
        uiView.setRegion(region, animated: true)
        /////////////////////////////////
        
        ///////////////////////////////現在位置？？？
//self.locationObserver.location.coordinate
        /*
        let coordinate2 = self.locationObserver.location.coordinate
           let annotation3 = MKPointAnnotation()
           let span3 = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
           let region3 = MKCoordinateRegion(center: coordinate2, span: span3)

           annotation3.coordinate = coordinate2
         annotation3.title = "現在位置"
           uiView.addAnnotation(annotation3)
        uiView.setRegion(region3, animated: true)*/
        
        ///////////////////////////////
    }
}

struct MapTest_Previews: PreviewProvider {
    static var previews: some View {
        MapTest(coordinate: landmarkData[7].locationCoordinate)
    }
}
