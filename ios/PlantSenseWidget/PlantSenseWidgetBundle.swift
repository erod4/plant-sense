//
//  PlantSenseWidgetBundle.swift
//  PlantSenseWidget
//
//  Created by Enrique  Rodriguez on 8/3/24.
//

import WidgetKit
import SwiftUI

@main
struct PlantSenseWidgetBundle: WidgetBundle {
    var body: some Widget {
        PlantSenseWidget()
        PlantSenseWidgetLiveActivity()
    }
}
