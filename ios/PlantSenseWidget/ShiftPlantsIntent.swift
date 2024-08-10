import AppIntents
import Foundation
import WidgetKit
struct ShiftPlantsIntentLeft: AppIntent {
    static var title: LocalizedStringResource = "Shift Plants Left"
  
    @Parameter(title: "index")
    var index: Int

    init() { }
    init(index: Int) {
        self.index = index
    }

    func perform() async throws -> some IntentResult {
        let currentIndex = UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget")?.integer(forKey: "plantIndex") ?? 0
        UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget")?.set((currentIndex - 1 + 4) % 4, forKey: "plantIndex")
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}

struct ShiftPlantsIntentRight: AppIntent {
    static var title: LocalizedStringResource = "Shift Plants Right"
  
    @Parameter(title: "index")
    var index: Int

    init() { }
    init(index: Int) {
        self.index = index
    }

    func perform() async throws -> some IntentResult {
        let currentIndex = UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget")?.integer(forKey: "plantIndex") ?? 0
        UserDefaults(suiteName: "group.com.PlantSense.PlantSenseWidget")?.set((currentIndex + 1)%4, forKey: "plantIndex")
        WidgetCenter.shared.reloadAllTimelines()
        return .result()
    }
}
