//
//  Sample.swift
//  Landmarks
//
//  Created by Soichiro Kuroyanagi on 2020/03/19.
//  Copyright © 2020 Apple. All rights reserved.
//

import SwiftUI

struct Sample: View {
    @State private var selectedColor = 0
    let colors = ["赤", "緑", "青"]

    var body: some View {
       NavigationView{
          Form {
            Section(header: Text("セグメンテッドコントロール \(selectedColor)").font(.headline)) {

                Picker(selection: $selectedColor, label: Text("色選択")) {
                   Text(self.colors[0]).tag(0)
                   Text(self.colors[1]).tag(1)
                   Text(self.colors[2]).tag(2)
                }
                .pickerStyle(SegmentedPickerStyle())
             
            }
    }
       }
    }}

struct Sample_Previews: PreviewProvider {
    static var previews: some View {
        Sample()
    }
}
