import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            RecentChart(records: TestData().weightRecords)
                
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
