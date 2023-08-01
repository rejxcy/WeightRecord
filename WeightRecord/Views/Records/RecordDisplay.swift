import SwiftUI

struct RecordDisplay: View {
    @State private var showingProfile = false
    @State private var showingNewRecord = false
    
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
                Button {
                    showingNewRecord.toggle()
                } label: {
                    Label("Add Record", systemImage: "note.text.badge.plus")
                }
            }
            .sheet(isPresented: $showingProfile) {
                ProfileHost()
            }
            .sheet(isPresented: $showingNewRecord) {
                NewRecord() 
            }
        }
    }
}


struct RecordDisplay_Previews: PreviewProvider {
    static var previews: some View {
        RecordDisplay(records: TestData().weightRecords)
    }
}
