import SwiftUI

struct ProfileSummary: View {
    var profile: Profile
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(profile.username)
                    .bold()
                    .font(.title)
                Text("每日提醒通知: \(profile.prefersNotifications ? "on" : "off")")
                Text("性別: \(profile.gender.rawValue)")
                Text("年齡: \(profile.age)")
                Text("身高: \(profile.height)")
                
                Divider()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("資料觀察📋")
                    Text("目前體重: \(profile.weight)")
                    Text("每值週運動次數: \(profile.activityTime)")
                    Text("每日熱量建議: xxxx kcal")
                }
            }
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: TestData().profile)
    }
}
