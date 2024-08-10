import WidgetKit
import SwiftUI

struct ShiftPlantOverlay: View {
    let index: Int
    let len:Int
    var body: some View {
        GeometryReader { geometry in

          VStack{
            Spacer()
            HStack {
              Button(intent: ShiftPlantsIntentLeft(index: index)) {
                  Image(systemName: "chevron.left")
              }
              Spacer()
                ForEach(0..<len, id: \.self) { circleIndex in
                    Circle()
                        .fill(circleIndex == index ? Color.blue : Color.gray) // Change color based on index
                        .frame(width: 10, height: 10) // Adjust the size of the circles
                        .padding(2) // Add padding between circles
                }
              Spacer()
               Button(intent: ShiftPlantsIntentRight(index: index)) {
                   Image(systemName: "chevron.right")
               }
            }.padding(5)
          }
            
            
        }
    }
}
