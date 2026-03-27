import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            WebView(fileName: "index")
                .allowsHitTesting(true)
                .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
