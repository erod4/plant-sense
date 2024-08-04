import WidgetKit
import SwiftUI

struct Provider: TimelineProvider {
    @AppStorage("plantIndex", store: UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget"))
    var plantIndex: Int = 0

    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), index: plantIndex)
    }

    func getSnapshot(in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        let entry = SimpleEntry(date: Date(), index: plantIndex)
        completion(entry)
    }

    func getTimeline(in context: Context, completion: @escaping (Timeline<SimpleEntry>) -> ()) {
        var entries: [SimpleEntry] = []
        
        // Generate a timeline consisting of five entries an hour apart, starting from the current date.
        let currentDate = Date()
        
        for hourOffset in 0 ..< 5 {
            let entryDate = Calendar.current.date(byAdding: .hour, value: hourOffset, to: currentDate)!
            let entry = SimpleEntry(date: entryDate, index: plantIndex)
            entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let index: Int
}

struct PlantSenseWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        HStack {
            ShiftPlantOverlay(index: entry.index)
        }
    }
}

struct PlantSenseWidget: Widget {
    let kind: String = "PlantSenseWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            PlantSenseWidgetEntryView(entry: entry)
                .containerBackground(.fill.tertiary, for: .widget)
        }.contentMarginsDisabled()
        .supportedFamilies([.systemMedium])
    }
}

#Preview(as: .systemSmall) {
    PlantSenseWidget()
} timeline: {
  SimpleEntry(date: .now, index: 0)
  SimpleEntry(date: .now, index: 0)
}
