import SwiftUI

struct RecordRow: View {
    var record: WeightRecord
    var compareLast: Double
    
    var body: some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                Text(record.getDateString())
                    .font(.headline)
                
                HStack(spacing: 4) {
                    Image(systemName: record.sport ? "checkmark.circle" : "xmark.circle")
                        .foregroundColor(record.sport ? .green : .red)
                    Text("運動")
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
                .padding(3)
            }
            
            HStack(spacing: 4) {
                Image(systemName: "scale.mass")
                    .foregroundColor(.blue)
                Text(String(format: "%.1f kg", record.weight))
                    .font(.subheadline)
                    .foregroundColor(.primary)
            }
            
            if compareLast != 0 {
                HStack(spacing: 4) {
                    Image(systemName: compareLast <= 0 ? "arrow.down.right" : "arrow.up.right")
                        .foregroundColor(compareLast <= 0 ? .green : .red)
                    Text(String(format: "%.1f", compareLast))
                        .font(.subheadline)
                        .foregroundColor(.primary)
                }
            }
            
            Spacer()
            
            Text(record.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 8)
    }
}


struct RecordRow_Previews: PreviewProvider {
    static var previews: some View {
        RecordRow(record: TestData().weightRecords[0], compareLast: -0.5)
            .previewLayout(.fixed(width: 400, height: 70))
    }
}
