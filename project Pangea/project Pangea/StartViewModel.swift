import SwiftUI

class StartViewModel: ObservableObject {
    @Published var isMapLoaded = false
    
    func loadMap() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isMapLoaded = true
        }
    }
}
