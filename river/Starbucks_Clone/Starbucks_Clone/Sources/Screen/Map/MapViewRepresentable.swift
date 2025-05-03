//
//  MapViewRepresentable.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    
    @Binding var selectedCoordinate: CLLocationCoordinate2D?
    @Binding var cameraCenter: CLLocationCoordinate2D?
    @Bindable var locationManager: LocationManager
    @Bindable var storeSelectSheetViewModel: StoreSelectSheetViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let nearbyStores = storeSelectSheetViewModel.storeList.filter {
            $0.distance <= 10.0
        }
        if let current = locationManager.currentLocation {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: current.coordinate.latitude,
                    longitude: current.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.18, longitudeDelta: 0.18)
            )
            uiView.setRegion(region, animated: true)
        }
        
        uiView.removeAnnotations(uiView.annotations)
        let annotations = nearbyStores.map { store -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = store.title
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: store.coordinate.latitude,
                longitude: store.coordinate.longitude
            )
            return annotation
        }
        uiView.addAnnotations(annotations)
    }
    
    
    // MARK: - Nested Type의 Coordinator 클래스
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapViewRepresentable
        
        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }
        
        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
            parent.cameraCenter = mapView.centerCoordinate
        }
    }
}
