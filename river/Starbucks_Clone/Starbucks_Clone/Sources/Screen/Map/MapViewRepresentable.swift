//
//  MapViewRepresentable.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @Bindable var locationManager: LocationManager
    @Bindable var storeSelectSheetViewModel: StoreSelectSheetViewModel
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }
    
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
        
        if let current = locationManager.currentLocation {
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: current.coordinate.latitude,
                    longitude: current.coordinate.longitude
                ),
                span: MKCoordinateSpan(latitudeDelta: 0.18, longitudeDelta: 0.18)
            )
            mapView.setRegion(region, animated: true)
        }
        
        return mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        let nearbyStores = storeSelectSheetViewModel.storeList.filter {
            $0.distance <= 10.0 // 거리가 10Km 이하인 매장만 필터링
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
    class Coordinator: NSObject, MKMapViewDelegate {}
}
