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
    
    func makeUIViewController(context: Context) -> MapViewController {
        let vc = MapViewController()
        vc.regionToSet = region
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
}

class MapViewController: UIViewController {
    
    let mapView = MKMapView()
    private var isSystemAnimationFlag: Bool = true
    
    var regionToSet: MKCoordinateRegion?
    
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
        mapView.delegate = self
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

extension MapViewController: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        regionWillChangeAnimated animated: Bool
    ) {
        if isSystemAnimationFlag {
            isSystemAnimationFlag = false
        } else {
            print("사용자 움직임")
        }
    }
}
