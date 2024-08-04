//
//  PlantSenseWidgetLiveActivity.swift
//  PlantSenseWidget
//
//  Created by Enrique  Rodriguez on 8/3/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct PlantSenseWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct PlantSenseWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: PlantSenseWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension PlantSenseWidgetAttributes {
    fileprivate static var preview: PlantSenseWidgetAttributes {
        PlantSenseWidgetAttributes(name: "World")
    }
}

extension PlantSenseWidgetAttributes.ContentState {
    fileprivate static var smiley: PlantSenseWidgetAttributes.ContentState {
        PlantSenseWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: PlantSenseWidgetAttributes.ContentState {
         PlantSenseWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: PlantSenseWidgetAttributes.preview) {
   PlantSenseWidgetLiveActivity()
} contentStates: {
    PlantSenseWidgetAttributes.ContentState.smiley
    PlantSenseWidgetAttributes.ContentState.starEyes
}
