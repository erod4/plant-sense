import AppIntents
import Foundation

struct ShiftPlantsIntentLeft: AppIntent {
    static var title: LocalizedStringResource = "Shift Plants Left"
  
    @Parameter(title: "index")
    var index: Int

    init() { }
    init(index: Int) {
        self.index = index
    }

    func perform() async throws -> some IntentResult {
        let currentIndex = UserDefaults(suiteName: "group.com.yourapp.PlantSense")?.integer(forKey: "plantIndex") ?? 0
        UserDefaults(suiteName: "group.com.yourapp.PlantSense")?.set((currentIndex - 1 + 4) % 4, forKey: "plantIndex")
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
        let currentIndex = UserDefaults(suiteName: "group.com.yourapp.PlantSense")?.integer(forKey: "plantIndex") ?? 0
        UserDefaults(suiteName: "group.com.yourapp.PlantSense")?.set((currentIndex + 1)%4, forKey: "plantIndex")
        return .result()
    }
}
