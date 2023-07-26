import Foundation

struct WeightRecord {
    let date: Date
    let weight: Double

    init(date: Date, weight: Double) {
        self.date = date
        self.weight = weight
    }
    
    func getDateString(format: String = "MM/dd") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }
    
}
