import SwiftUI

struct RecordDisplay: View {
    @State private var showingProfile = false
    
    var records: [WeightRecord]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            RecordChart(records: records)
            RecordList(records: records)
        }
    }
}


struct RecordDisplay_Previews: PreviewProvider {
    static var previews: some View {
        RecordDisplay(records: TestData().weightRecords)
    }
}
