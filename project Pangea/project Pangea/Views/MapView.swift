import SwiftUI
import MapKit

struct MapView: View {
    @State private var position: MapCameraPosition = .automatic
    @State private var overlays: [MKPolygon] = []

    var body: some View {
        Map(position: $position) {
            ForEach(overlays, id: \.self) { polygon in
                MapPolygon(polygon)
                    .stroke(Color.blue, lineWidth: 2)
                    .foregroundStyle(Color.blue.opacity(0.2))
            }
        }
        .mapControls {
            MapUserLocationButton()
            MapCompass()
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            if let geoJSONURL = Bundle.main.url(forResource: "test_2", withExtension: "geojson") {
                let loadedPolygons = GeoJSONLoader.loadGeoJSON(from: geoJSONURL)
                print("Загружено \(loadedPolygons.count) полигонов")
                overlays = loadedPolygons
            }
        }
    }
}
