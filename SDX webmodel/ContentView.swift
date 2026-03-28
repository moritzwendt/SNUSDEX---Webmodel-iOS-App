import SwiftUI

struct ContentView: View {
    @StateObject var networkMonitor = NetworkMonitor()
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            if networkMonitor.isConnected {
                WebView(urlString: "https://www.snusdex.com/")
                    .allowsHitTesting(true)
                    .ignoresSafeArea()
            } else {
                VStack(spacing: 20) {
                    Image(systemName: "wifi.slash")
                        .font(.system(size: 50))
                        .foregroundColor(.white)
                    
                    Text("You are offline")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Text("Please connect to the internet to use SNUSDEX®.")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .padding(.horizontal)
                    
                    Button(action: {

                    }) {
                        Text("Try again")
                            .fontWeight(.semibold)
                            .padding()
                            .background(Color.white)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}
