import SwiftUI

struct StartView: View {
    @StateObject private var viewModel = StartViewModel()
        
    var body: some View {
        Group {
            if viewModel.isMapLoaded {
                MapView()
            } else {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                    
                    Text("Welcome to Pangea, User")
                        .padding()
                    
                    ProgressView()
                        .progressViewStyle(.circular)
                        .frame(width: 25, height: 25)
                }
                .onAppear { viewModel.loadMap() }
            }
        }.animation(.easeInOut, value: viewModel.isMapLoaded)
    }
}


#Preview {
    StartView()
}
