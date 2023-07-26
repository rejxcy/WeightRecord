import SwiftUI
import Charts

struct RecentChart: View {
    
    var records: [WeightRecord]
    var averageWeight: Double {
        let totalWeight = records.reduce(0.0) { $0 + $1.weight }
        return totalWeight / Double(records.count)
    }
    
    var body: some View {
        
        VStack( alignment: .leading) {
            Text("近七天體重紀錄")
                .padding(.bottom, -10)
            
            Chart {
                ForEach(records.indices, id: \.self) { index in
                    LineMark(
                        x: .value("Day", records[index].getDateString()),
                        y: .value("Weight", records[index].weight)
                    )
                }
            }
            .chartYScale(domain: [averageWeight - 4, averageWeight + 4])
            .frame(height: 200)
            .chartXAxis(.hidden)
            .chartYAxis {
                AxisMarks(position: .leading)
            }
        }
        .padding()
        
    }
}

struct RecentChart_Previews: PreviewProvider {
    static var previews: some View {
        RecentChart(records: TestData().weightRecords)
    }
}
