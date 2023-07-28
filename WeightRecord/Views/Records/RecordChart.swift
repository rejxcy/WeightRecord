import SwiftUI
import Charts

struct RecordChart: View {
    
    var records: [WeightRecord]
    
    var body: some View {
        
        Chart {
            ForEach(records.indices, id: \.self) { index in
                LineMark(
                    x: .value("Day", records[index].getDateString()),
                    y: .value("Weight", records[index].weight)
                )
            }
        }
        .padding(5)
        .frame(height: 250)
        .chartXAxis(.hidden)
        .chartYScale(domain: [records.map { $0.weight }.min()! - 0.5,
                              records.map { $0.weight }.max()! + 0.5])
        .chartYAxis {
            AxisMarks(position: .leading)
        }
        .chartPlotStyle { plotArea in
            plotArea
                .background(.blue.opacity(0.1))
        }
        
    }
}

struct RecordChart_Previews: PreviewProvider {
    static var previews: some View {
        RecordChart(records: TestData().weightRecords)
    }
}
