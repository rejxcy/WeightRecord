import SwiftUI

struct ProfileEditor: View {
    @Binding var profile: Profile
    
    var body: some View {
        List {
            HStack {
                Text("Username").bold()
                Divider()
                TextField("Username", text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications) {
                Text("Enable Notifications").bold()
            }
            
            HStack {
                Text("Gender").bold()
                Divider()
                Picker("Gender", selection: $profile.gender) {
                    ForEach(Profile.Gender.allCases) { gender in
                        Text(gender.rawValue).tag(gender)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            HStack {
                Text("Height").bold()
                Divider()
                TextField("Height", text: $profile.height)
                    .padding(.horizontal, 20)
            }
        }
        
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(TestData().profile))
    }
}
