//
//  PlantSenseWidgetEntryView.swift
//  PlantSenseWidgetExtension
//
//  Created by Enrique  Rodriguez on 8/4/24.
//

import SwiftUI

struct PlantSenseWidgetEntryView : View {
  
    var entry: Provider.Entry
  var body: some View {
    GeometryReader { geometry in
    VStack {
      HStack {
                          Spacer()
        Spacer()
                          Text("Plant \(entry.data[entry.index].id+1)")
                              .padding(.top, 3)
                              .font(.title2)
                              .bold()
                          Spacer()
                          BatteryView(batteryLevel: CGFloat(entry.data[entry.index].battery)/100.0)
          .frame(width: 50, height: 12).padding(.trailing, 25)
                      }
                      Spacer()
      
      HStack{
        VStack{
          ZStack {
                          // 2
            ProgressBar(progress:  entry.data[entry.index].humidity/100)
                   // 3
            HStack(spacing: 0){
              Text("\(entry.data[entry.index].humidity , specifier: "%.0f")").font(.title3)
              Text("%").font(.footnote)
            }
              
                              .bold()
          }.frame(width: geometry.size.width/3.3, height: geometry.size.height/2.8)
          Text("Hum")
        }
        Spacer()
        VStack{
          ZStack {
                          // 2
            ProgressBar(progress:  entry.data[entry.index].moisture/100)
                          // 3
            HStack(spacing: 0){
              Text("\(entry.data[entry.index].moisture , specifier: "%.0f")").font(.title3)
Text("%").font(.footnote)
            }.bold()
                              
          }.frame(width: geometry.size.width/3.3, height: geometry.size.height/2.8)
          Text("Moist")
        }
        Spacer()
        VStack{
          ZStack {
                          // 2
            ProgressBar(progress:  entry.data[entry.index].temperature/100)
                          // 3
            HStack(spacing: 0)
            {
              Text("\(entry.data[entry.index].temperature , specifier: "%.0f")").font(.title3)
              Text("°F").font(.footnote)
            }.bold()
                           
          }.frame(width: geometry.size.width/3.3, height: geometry.size.height/2.8)
          Text("Temp")
        }
      }.padding(3)
      Spacer()
      Spacer()

    }.frame(width: geometry.size.width,height: geometry.size.height).overlay(
      ShiftPlantOverlay(index: entry.index,len: entry.data.count)
        
    )
   

  }
    }
}
