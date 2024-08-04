//
//  ShiftPlantOverlay.swift
//  PlantSense
//
//  Created by Enrique  Rodriguez on 8/3/24.
//

import WidgetKit
import SwiftUI

struct ShiftPlantOverlay: View {
  let index: Int
  var body: some View {
    GeometryReader { geometry in
      
      VStack{
        Spacer()

        HStack {
       
            Button(intent: ShiftPlantsIntentLeft(index: index)) {
              Image(systemName: "chevron.left")
            }
  
          
          Spacer()
 
            Button(intent: ShiftPlantsIntentRight(index: index)) {
              Image(systemName: "chevron.right")
            }
          
        }
        .padding() // Add padding for better spacing
        Spacer()
        HStack {
          ForEach(0..<4, id: \.self) { circleIndex in
            Circle()
              .fill(circleIndex == index ? Color.blue : Color.gray) // Change color based on index
              .frame(width: 10, height: 10) // Adjust the size of the circles
              .padding(2) // Add padding between circles
          }
        }.padding(3)
      }.frame(width: geometry.size.width, height: geometry.size.height)
      
      
    }
  }
  
  
  
  
}
