import Foundation

struct WeightRecord {
    let id: Int64
    let date: Date
    let weight: Double
    let sport: Bool
    let description: String
    
    func getDateString(format: String = "MM/dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}
