import SwiftUI

struct RecordList: View {
    var records: [WeightRecord]
    
    var body: some View {
        
        VStack {
            ForEach(records.indices.reversed(), id: \.self) { index in
                RecordRow(record: records[index], compareLast: getCompareLast(index: index))
            }
        }
        .padding(.horizontal, 10)
        
    }
    
    private func getCompareLast(index: Int) -> Double {
        guard index > 0 else { return 0 }
        let record = records[index]
        let previousRecord = records[index - 1]
        return record.weight - previousRecord.weight
    }
}

struct RecordList_Previews: PreviewProvider {
    static var previews: some View {
        RecordList(records: TestData().weightRecords)
    }
}
