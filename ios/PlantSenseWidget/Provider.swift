//
//  Provider.swift
//  PlantSenseWidgetExtension
//
//  Created by Enrique  Rodriguez on 8/4/24.
//
import WidgetKit
import SwiftUI
import Foundation
import WidgetKit

struct Provider: TimelineProvider {
  typealias Entry = PlantEntry
    @AppStorage("plantIndex", store: UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget"))
    var plantIndex: Int = 0

    func placeholder(in context: Context) -> PlantEntry {
        PlantEntry(date: Date(), index: 0,data: [PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50)])
    }

    func getSnapshot(in context: Context, completion: @escaping (PlantEntry) -> ()) {
        let entry = PlantEntry(date: Date(), index: 0,data: [PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50),PlantData(id: 0, temperature: 50.0, humidity: 50.0, moisture: 50.0,battery: 50)])
        completion(entry)
    }

  func getTimeline(in context: Context, completion: @escaping (Timeline<PlantEntry>) -> ()) {
         var entries: [PlantEntry] = []

         if let savedString = UserDefaults(suiteName: "group.PlantSense")?.string(forKey: "Test"),
            let data = savedString.data(using: .utf8) {
             do {
                 let plantDataArray = try JSONDecoder().decode([PlantData].self, from: data)
                 let currentDate = Date()
                 
                 let entryDate = currentDate // You can adjust this based on your timeline requirements
                 let entry = PlantEntry(date: entryDate,index: plantIndex, data: plantDataArray)
                 entries.append(entry)
                 
                 let timeline = Timeline(entries: entries, policy: .atEnd)
                 completion(timeline)
             } catch {
                 print("Failed to decode JSON: \(error.localizedDescription)")
             }
         } else {
             print("No data found for key 'Test'")
         }
     }
}
 
