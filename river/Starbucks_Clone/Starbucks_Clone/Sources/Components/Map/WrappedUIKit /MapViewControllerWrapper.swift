//
//  MapViewControllerWrapper.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import UIKit
import SwiftUI
import MapKit

// TODO: MapView 리팩토링 필요(모든 뷰에서 재사용 가능하도록 + LocationManager 같은 것들은 뷰모델에서 관리하도록 변경 역시 필요)
struct MapViewControllerWrapper<ViewModel: MapControllable>: UIViewControllerRepresentable {
    private let mapView = MKMapView()
    let region: MKCoordinateRegion
    @Bindable var locationManager: LocationManager
    @Bindable var viewModel: ViewModel
    @Binding var isUserInteracting: Bool
    @Binding var isSystemAnimationFlag: Bool
    
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
        uiViewController.mapView.removeAnnotations(
            uiViewController.mapView.annotations
        )
        let annotations = viewModel.nearbyStores.map { store -> MKPointAnnotation in
            let annotation = MKPointAnnotation()
            annotation.title = store.title
            annotation.coordinate = CLLocationCoordinate2D(
                latitude: store.coordinate.latitude,
                longitude: store.coordinate.longitude
            )
            return annotation
        }
        uiViewController.mapView.addAnnotations(annotations)
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
        
        func mapView(
            _ mapView: MKMapView,
            regionWillChangeAnimated animated: Bool
        ) {
            if parent.isSystemAnimationFlag {
                parent.isSystemAnimationFlag = false
                print("사용자 감지: \(parent.isUserInteracting)")
            } else {
                parent.isUserInteracting = true
                print("사용자 감지: \(parent.isUserInteracting)")
            }
        }
    }
}
