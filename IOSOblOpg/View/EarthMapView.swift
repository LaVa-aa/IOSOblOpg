//
//  EarthMapView.swift
//  IOSOblOpg
//


import SwiftUI
import Foundation
import MapKit


final class MapViewModel: ObservableObject {
        @Published var earthquakeCoordinates: MKCoordinateRegion
        var place: IdentifiablePlace

        init(lat: Double, lon: Double) {
            earthquakeCoordinates = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: lat, longitude: lon), latitudinalMeters: 2000, longitudinalMeters: 3000)
            //Create new instance
            place = IdentifiablePlace(lat: lat, long: lon)
        }
    }

    struct IdentifiablePlace: Identifiable {
        let id: UUID
        let location: CLLocationCoordinate2D
        init(id: UUID = UUID(), lat: Double, long: Double) {
            self.id = id
            self.location = CLLocationCoordinate2D(
                latitude: lat,
                longitude: long)
        }
    }

    struct PinAnnotationMapView: View {
        @ObservedObject var pin: MapViewModel

        init (lat: Double, lon: Double){
            pin = MapViewModel(lat: lat, lon: lon)
        }

        var body: some View {
            Map(coordinateRegion: $pin.earthquakeCoordinates,
                annotationItems: [pin.place])
            { place in
                MapMarker(coordinate: place.location,
                       tint: Color.black)
            }
            .ignoresSafeArea()
        }
    }



struct MapViewModel_Previews: PreviewProvider {
    static var previews: some View {
        PinAnnotationMapView(lat: 55.9396761, lon: 9.5155848)
    }
}
