import SwiftUI

struct Loop: View {
    let names: [String] = ["jeon", "kim", "lee", "cho"]
    var body: some View {
        VStack {
            ForEach(names, id: \.self) { name in
                Text(name)
            }
        }
    }
}

struct Loop_Previews: PreviewProvider {
    static var previews: some View {
        Loop()
    }
}
