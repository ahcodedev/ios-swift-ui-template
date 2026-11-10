import Playgrounds
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(helloWorld())
            .padding()
    }

    func helloWorld() -> String {
        return "Hello, world!"
    }
}

#Preview {
    ContentView()
}

#Playground {
    _ = 1 + 2
}
