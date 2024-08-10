import WidgetKit
import SwiftUI

struct PlantData: Codable {
    let id: Int
    let temperature: Double
    let humidity: Double
    let moisture: Double
  let battery:Int
}
struct PlantEntry: TimelineEntry {
    let date: Date
    let index: Int
  let data: [PlantData]

}



struct PlantSenseWidget: Widget {
    let kind: String = "PlantSenseWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            PlantSenseWidgetEntryView(entry: entry)
          
                .containerBackground(.fill.tertiary, for: .widget)
        }.contentMarginsDisabled()
        .supportedFamilies([.systemMedium]  )
    }
}

#Preview(as: .systemSmall) {
    PlantSenseWidget()
} timeline: {
  PlantEntry(date: .now, index: 0,data: [PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50)])
}
