import Foundation

struct WeightRecord {
    let date: Date
    let weight: Double
    let sport: Bool
    let description: String

    init(date: Date, weight: Double, sport: Bool = false, description: String = "") {
        self.date = date
        self.weight = weight
        self.sport = sport
        self.description = description
    }
    
    func getDateString(format: String = "MM/dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}
