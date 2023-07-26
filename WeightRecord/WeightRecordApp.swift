import SwiftUI

@main
struct WeightRecordApp: App {
    @StateObject private var testData = TestData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(testData)
        }
    }
}
