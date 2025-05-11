//
//  MapViewControllerWrapper.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import UIKit
import SwiftUI
import MapKit

struct MapViewControllerWrapper: UIViewControllerRepresentable {
    let region: MKCoordinateRegion
    @Bindable var locationManager: LocationManager
    @Bindable var storeSelectSheetViewModel: StoreSelectSheetViewModel
    @Binding var isUserInteracting: Bool
    
    func makeUIViewController(context: Context) -> MapViewController {
        let vc = MapViewController()
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
        let nearbyStores = storeSelectSheetViewModel.storeList.filter {
            $0.distance <= 10.0 // 거리가 10Km 이하인 매장만 필터링
        }
        
        uiViewController.mapView.removeAnnotations(
            uiViewController.mapView.annotations
        )
        let annotations = nearbyStores.map { store -> MKPointAnnotation in
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
        private var isSystemAnimationFlag: Bool = true
        
        init(parent: MapViewControllerWrapper) {
            self.parent = parent
        }
        
        func mapView(
            _ mapView: MKMapView,
            regionWillChangeAnimated animated: Bool
        ) {
            if isSystemAnimationFlag {
                isSystemAnimationFlag = false
                print("사용자 감지: \(parent.isUserInteracting)")
            } else {
                parent.isUserInteracting = true
                print("사용자 감지: \(parent.isUserInteracting)")
            }
        }
    }
}

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    var regionToSet: MKCoordinateRegion?
//    var onUserInteractionChanged: ((Bool) -> Void)?
//    private var isSystemAnimationFlag: Bool = true
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMapView()
        setupLayout()
    }
    
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        if let region = regionToSet {
            mapView.setRegion(region, animated: true)
        }
    }
    
    private func setupMapView() {
//        mapView.delegate = self
        mapView.isRotateEnabled = false
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .none
    }
    
    private func setupLayout() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)

        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

/// 콜백 방식으로 딜리게이트 구현
//extension MapViewController: MKMapViewDelegate {
//    func mapView(
//        _ mapView: MKMapView,
//        regionWillChangeAnimated animated: Bool
//    ) {
//        if isSystemAnimationFlag {
//            isSystemAnimationFlag = false
//        } else {
//            onUserInteractionChanged?(true)
//            print("사용자 움직임")
//        }
//    }
//}
