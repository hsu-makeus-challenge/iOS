//
//  MapViewControllerWrapper.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import UIKit
import SwiftUI
import MapKit

// TODO: MapView 리팩토링 필요(모든 뷰에서 재사용 가능하도록)
struct MapViewControllerWrapper: UIViewControllerRepresentable {
    private let mapView = MKMapView()
    let region: MKCoordinateRegion
    @Bindable var mapViewModel: MapViewModel
    @Binding var isUserInteracting: Bool
    @Binding var isSystemAnimationFlag: Bool
    
    let coordinates: [CLLocationCoordinate2D]
    
    func makeUIViewController(context: Context) -> MapViewController {
        let vc = MapViewController(mapView: mapView)
        vc.regionToSet = region
        vc.mapView.delegate = context.coordinator
        // 콜백 방식으로 클로저 등록하여 사용자 제스처 감지
//        vc.onUserInteractionChanged = { isInteracting in
//            self.isUserInteracting = isInteracting
//        }
        return vc
    }
    
    func updateUIViewController(
        _ uiViewController: MapViewController,
        context: Context
    ) {
        let storeProvider = mapViewModel.getStoreProvider()
        uiViewController.mapView.removeAnnotations(
            uiViewController.mapView.annotations
        )
//        let annotations = storeProvider.getNearbyStores(within: 10).map { store -> MKPointAnnotation in
//            let annotation = MKPointAnnotation()
//            annotation.title = store.title
//            annotation.coordinate = CLLocationCoordinate2D(
//                latitude: store.coordinate.latitude,
//                longitude: store.coordinate.longitude
//            )
//            return annotation
//        }
//        uiViewController.mapView.addAnnotations(annotations)
//        
//        uiViewController.mapView.removeOverlays(uiViewController.mapView.overlays)
        
        if coordinates.count > 1 {
            let polyline = MKPolyline(coordinates: coordinates, count: coordinates.count)
            uiViewController.mapView.addOverlay(polyline)
            
            let region = MKCoordinateRegion(
                center: coordinates.first!,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
            )
            uiViewController.mapView.setRegion(region, animated: true)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    /// Coordinator를 사용하여 딜리게이트 구현
    class Coordinator: NSObject, MKMapViewDelegate {
        private var parent: MapViewControllerWrapper
        
        init(parent: MapViewControllerWrapper) {
            self.parent = parent
        }
        
        /// region 변화 완료 후 호출되는 메서드
        func mapView(
            _ mapView: MKMapView,
            regionWillChangeAnimated animated: Bool
        ) {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                if parent.isSystemAnimationFlag {
                    parent.isSystemAnimationFlag = false
                    print("사용자 감지: \(parent.isUserInteracting)")
                } else {
                    parent.isUserInteracting = true
                    print("사용자 감지: \(parent.isUserInteracting)")
                }
            }
        }
        
        /// Map Overlay 하는 메서드
        func mapView(_ mapView: MKMapView, rendererFor overlay: any MKOverlay) -> MKOverlayRenderer {
            if let polyline = overlay as? MKPolyline {
                let renderer = MKPolylineRenderer(polyline: polyline)
                renderer.strokeColor = .blue
                renderer.lineWidth = 4
                return renderer
            }
            return MKOverlayRenderer(overlay: overlay)
        }
    }
}
