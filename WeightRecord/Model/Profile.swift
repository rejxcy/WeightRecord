import Foundation

struct Profile {
    var username: String
    var gender = Gender.man
    var age: Int
    var height: String
    var weight: Double
    var activityTime: Int
    var prefersNotifications = false
    
    enum Gender: String, CaseIterable, Identifiable {
        var id: String { rawValue }
        
        case unknow  = "unknow"
        case man = "man"
        case woman = "woman"
    }
}
