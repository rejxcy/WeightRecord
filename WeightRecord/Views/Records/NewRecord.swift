import SwiftUI

struct NewRecord: View {
    @State var todate: Date = Date()
    @State var weight = ""
    @State var sport = 0
    @State var description = ""
    
    var body: some View {
        
        List {
            DatePicker("Date", selection: $todate, in: ...Date(), displayedComponents: .date)
                .datePickerStyle(.graphical)
            
            HStack {
                Text("weight").bold()
                Divider()
                TextField("kg", text: $weight)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Text("Sport").bold()
                Divider()
                Picker("Sport", selection: $sport) {
                    Text("no").tag(0)
                    Text("yes").tag(1)
                    
                }
                .pickerStyle(.segmented)
            }
            
            HStack {
                Text("description").bold()
                Divider()
                TextField("write something or not", text: $description)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            
            HStack {
                Spacer()
                Button("Save") {
                    print("save record")
                }
                Spacer()
            }
        }
        
    }
}

struct NewRecord_Previews: PreviewProvider {
    static var previews: some View {
        NewRecord()
    }
}
