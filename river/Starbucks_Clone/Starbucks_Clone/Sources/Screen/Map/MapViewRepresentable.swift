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
    @Binding var showReloadBtn: Bool
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
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
            $0.distance <= 10.0 // 거리가 10Km 이하인 매장만 필터링
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
        
        init(parent: MapViewRepresentable) {
            self.parent = parent
        }
        
        // FIXME: 줌 레벨이 당겨지는 과정에서 카메라 이동이 감지되어 사용자가 지도 이동하기 전에 showReloadBtn가 true로 바뀌는 버그 수정 필요
        func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
            // 카메라 이동 완료 감지
            let center = mapView.centerCoordinate
            print("지도 중심 좌표가 바뀌었음: \(center.latitude), \(center.longitude)")
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.parent.showReloadBtn = true
            }
        }
    }
}
