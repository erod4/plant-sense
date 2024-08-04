//import Foundation
//import WidgetKit
//
//struct SharedPreferences {
//    static let suiteName = "group.streak"
//    static let widgetKey = "widgetKey"
//    
//    static func readSharedData() -> [WidgetData] {
//        guard let userDefaults = UserDefaults(suiteName: suiteName),
//              let data = userDefaults.data(forKey: widgetKey),
//              let widgetData = try? JSONDecoder().decode([WidgetData].self, from: data) else {
//            return []
//        }
//        return widgetData
//    }
//}
//
//struct WidgetData: Codable {
//    let id: Int
//    let temperature: Double
//    let humidity: Double
//    let moisture: Double
//}
