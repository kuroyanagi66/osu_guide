//
//  ViewController.swift
//  Location
//
//  Created by TSUBUSAKI AKIHIRO on 2019/11/23.
//  Copyright © 2019 TSUBUSAKI AKIHIRO. All rights reserved.
//

import UIKit
import CoreLocation

var ido = "1"
 var keido: String = "1"


class ViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    let geocoder = CLGeocoder()
    let text = [ "緯度", "経度"]
    var item: [ UILabel ] = []
    var location: [ UILabel ] = []
    var address: UILabel!
    //var keido = "1"
    //var ido = "1"
    
    
    
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
    
    func locationManager( _ manager: CLLocationManager, didUpdateLocations locations: [ CLLocation ] ) {
        //表示更新
        if let location = locations.first {
            
            //緯度・経度
            self.location[0].text = location.coordinate.latitude.description
            self.location[1].text = location.coordinate.longitude.description
            ido = location.coordinate.latitude.description
            keido = location.coordinate.longitude.description
            
 
        }
    }
    
}

