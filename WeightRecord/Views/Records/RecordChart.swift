import SwiftUI
import Charts

struct RecordChart: View {
    
    var records: [WeightRecord]
    var averageWeight: Double {
        let totalWeight = records.reduce(0.0) { $0 + $1.weight }
        return totalWeight / Double(records.count)
    }
    
    var body: some View {
        
        VStack( alignment: .leading) {
            Text("體重紀錄")
                .padding(.bottom, -20)
            
            Chart {
                ForEach(records.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Day", records[index].getDateString()),
                        y: .value("Weight", records[index].weight)
                    )
                }
            }
            .chartYScale(domain: [averageWeight - 3, averageWeight + 3])
            .frame(height: 250)
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
        .padding()
        
    }
}

struct RecordChart_Previews: PreviewProvider {
    static var previews: some View {
        RecordChart(records: TestData().weightRecords)
    }
}
