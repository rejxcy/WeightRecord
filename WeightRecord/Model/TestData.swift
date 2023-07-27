import Foundation


final class TestData: ObservableObject {
    @Published var weightRecords: [WeightRecord] = [
        WeightRecord(date: Date().addingTimeInterval(-6 * 86400), weight: 67.8, sport: true, description: "go to the gym"),
        WeightRecord(date: Date().addingTimeInterval(-5 * 86400), weight: 67.3),
        WeightRecord(date: Date().addingTimeInterval(-4 * 86400), weight: 68.0, sport: true, description: "go to the gym"),
        WeightRecord(date: Date().addingTimeInterval(-3 * 86400), weight: 66.8),
        WeightRecord(date: Date().addingTimeInterval(-2 * 86400), weight: 65.3, sport: true, description: "go to the gym"),
        WeightRecord(date: Date().addingTimeInterval(-86400), weight: 67.0),
        WeightRecord(date: Date(), weight: 65.5)
    ]
}







