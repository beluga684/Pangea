import Foundation
import MapKit

class GeoJSONLoader {
    static func loadGeoJSON(from url: URL) -> [MKPolygon] {
        do {
            let data = try Data(contentsOf: url)
            let geoJSONObjects = try MKGeoJSONDecoder().decode(data)

            var polygons: [MKPolygon] = []
            
            for object in geoJSONObjects {
                guard let feature = object as? MKGeoJSONFeature else { continue }

                for shape in feature.geometry {
                    if let polygon = shape as? MKPolygon {
                        polygons.append(polygon)
                    } else {
                        print("Не удалось преобразовать shape в MKPolygon: \(shape)")
                    }
                }
            }

            print("Загруженные полигоны: \(polygons.count)")
            return polygons

        } catch {
            print("Ошибка загрузки GeoJSON: \(error)")
            return []
        }
    }
}
