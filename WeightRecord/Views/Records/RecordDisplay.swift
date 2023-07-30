import SwiftUI

struct RecordDisplay: View {
    @State private var showingProfile = false
    
    var records: [WeightRecord]
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                RecordChart(records: records)
                RecordList(records: records)
            }
            .navigationBarTitle("Weight Records")
            .toolbar {
                Button {
                    showingProfile.toggle()
                } label: {
                    Label("User Profile", systemImage: "person.crop.circle")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
            
        }
    }
}


struct RecordDisplay_Previews: PreviewProvider {
    static var previews: some View {
        RecordDisplay(records: TestData().weightRecords)
    }
}
