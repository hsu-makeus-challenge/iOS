//
//  MapViewController.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let mapView: MKMapView
    var regionToSet: MKCoordinateRegion?
//    var onUserInteractionChanged: ((Bool) -> Void)?
//    private var isSystemAnimationFlag: Bool = true
    
    init(
        mapView: MKMapView,
        regionToSet: MKCoordinateRegion? = nil
    ) {
        self.mapView = mapView
        self.regionToSet = regionToSet
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
