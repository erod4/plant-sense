//
//  ProgressBar.swift
//  PlantSense
//
//  Created by Enrique  Rodriguez on 8/5/24.
//

import SwiftUI

struct ProgressBar: View {
  let progress: Double
      var body: some View {
        ZStack {
                   Circle()
                       .stroke(
                        Color.gray.opacity(0.5),
                        lineWidth: 8
                       )
                   Circle()
                       .trim(from: 0, to: progress)
                       .stroke(
                        Color.green,
                           style: StrokeStyle(
                               lineWidth: 8,
                               lineCap: .round
                           )
                       )
                       .rotationEffect(.degrees(-90))
                       // 1
                       .animation(.easeOut, value: progress)

               }
      }
}
