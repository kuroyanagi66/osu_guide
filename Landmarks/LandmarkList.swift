/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view showing a list of landmarks.
*/

import SwiftUI
import CoreLocation
import UIKit

struct LandmarkList: View {
    @EnvironmentObject private var userData: UserData
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var selectedColor = 0
    @State private var selectedMap = 0
    @State private var storeNum = 11
    
    let colors = ["all", "clothes", "cafe"]
    let maps = ["shops","map"]
    
    
    var body: some View {
        

        /*
          NavigationView {
                     NavigationLink(destination:         MapTest(coordinate: landmarkData[7].locationCoordinate)) {
                         Text("Show Next")
                     }
                 }
          */
        
    
        NavigationView {
            
            VStack{
                
                
                
                HStack{
Text("#大須 #古着 #カフェ　")
                    Image("map") .resizable()
                                   .frame(width: 30, height: 30)
                NavigationLink(destination: //MapTest(coordinate: landmarkData[7].locationCoordinate)){
                     SwiftUIView()){
                   // ContentView()){
                        Text("MAP")
                      
                            //.frame(maxWidth: .infinity, alignment: .leading)
                        
                    }
                
                }
                //   Form {
                  //      Section(header: //Text("セグメンテッドコントロール \(selectedColor)").font(.headline).hidden()) {

/*
                Picker(selection: $selectedMap, label: Text("色選択")) {
                   Text(self.maps[0]).tag(0)
                   Text(self.maps[1]).tag(1)
        
                }*/
                .pickerStyle(SegmentedPickerStyle())
                
                
    
                            Picker(selection: $selectedColor, label: Text("色選択")) {
                               Text(self.colors[0]).tag(0)
                               Text(self.colors[1]).tag(1)
                               Text(self.colors[2]).tag(2)
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        //}
              //  }
            List {
                //Toggle(isOn: $userData.showFavoritesOnly) {
                 //   Text("Show Favorites Only")
               // }
                /*
                HStack{
                    Image("map") .resizable()
                                   .frame(width: 50, height: 50)
                NavigationLink(destination: //MapTest(coordinate: landmarkData[7].locationCoordinate)){
                     SwiftUIView()){
                    Text("MAP")
                }
                }*/
                //////////////////
                //let aaa = ViewController2()
                //Text(keido)
               
                
                    
                   ForEach(userData.landmarks) { landmark in
                        if !landmark.isFavorite && self.selectedColor == 2 {
                            NavigationLink(
                                destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                            ) {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                    .onMove(perform: { (source, destination) in
                self.userData.landmarks.move(fromOffsets: source, toOffset: destination)
                    })
                
                ForEach(userData.landmarks) { landmark in
                    if landmark.isFavorite && self.selectedColor == 1 {
                        NavigationLink(
                            destination: LandmarkDetail(landmark: landmark)
                            .environmentObject(self.userData)
                        ) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
                .onMove(perform: { (source, destination) in
            self.userData.landmarks.move(fromOffsets: source, toOffset: destination)
                })
                
                
                        
                    ForEach(userData.landmarks) { landmark in
                        if  self.selectedColor == 0 {
                            NavigationLink(
                                destination: LandmarkDetail(landmark: landmark)
                                .environmentObject(self.userData)
                            ) {
                                LandmarkRow(landmark: landmark)
                            }
                        }
                    }
                    .onMove(perform: { (source, destination) in
                self.userData.landmarks.move(fromOffsets: source, toOffset: destination)
                    })
                    
            }
            .navigationBarTitle(Text("clothes & cafe").fontWeight(.thin).font(.body))
            //.navigationBarItems(trailing: EditButton())
        }
        //
            
            
        }
        
        ///

        ///
    }
}

struct LandmarksList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}


class ViewController2: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let text = [ "緯度", "経度"]
    var item: [ UILabel ] = []
    var location: [ UILabel ] = []
    var address: UILabel!
    var ido2: String = "1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //サイズ
        let width = self.view.frame.width / 2
        let height = self.view.frame.height / CGFloat( self.text.count + 2 )
        
        //ラベル
        for ( i, text ) in self.text.enumerated() {
            //項目
            self.item.append( UILabel() )
            self.item.last!.frame.size = CGSize( width: width, height: height )
            self.item.last!.frame.origin = CGPoint( x: 0, y: height * CGFloat( i + 1 ) )
            self.item.last!.textAlignment = .center
            self.item.last!.text = text
            self.view.addSubview( self.item.last! )
            
            //データ
            self.location.append( UILabel() )
            self.location.last!.frame.size = CGSize( width: width, height: height )
            self.location.last!.frame.origin = CGPoint( x: width, y: height * CGFloat( i + 1 ) )
            self.location.last!.textAlignment = .center
            self.view.addSubview( self.location.last! )
        }
        
        //住所
        self.address = UILabel()
        self.address.frame.size = CGSize( width: self.view.frame.width, height: height )
        self.address.frame.origin = CGPoint( x: 0, y: height * CGFloat( self.text.count + 1 ) )
        self.address.textAlignment = .center
        self.view.addSubview( self.address )
        
        //ロケーションマネージャ
        self.locationManager.requestWhenInUseAuthorization()
        let status = CLLocationManager.authorizationStatus()
        if status == .authorizedWhenInUse {
            self.locationManager.delegate = self
            self.locationManager.distanceFilter = 10
            self.locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [ CLLocation ] ) ->String{
        //表示更新
        if let location = locations.first {
            
            //緯度・経度
            self.location[0].text = location.coordinate.latitude.description
            self.location[1].text = location.coordinate.longitude.description
            ido = location.coordinate.latitude.description
            keido = location.coordinate.longitude.description
           

        }
        return ido
    }
    
}
