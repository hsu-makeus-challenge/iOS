//
//  MapViewController.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/11/25.
//

import UIKit
import MapKit
import SnapKit

class MapViewController: UIViewController {
    
    let mapView: MKMapView
    var regionToSet: MKCoordinateRegion?
//    var onUserInteractionChanged: ((Bool) -> Void)?
//    private var isSystemAnimationFlag: Bool = true
    private let trackingButton: MKUserTrackingButton?
    
    init(
        mapView: MKMapView,
        regionToSet: MKCoordinateRegion? = nil
    ) {
        self.mapView = mapView
        self.regionToSet = regionToSet
        self.trackingButton = MKUserTrackingButton(mapView: mapView)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMapView()
        setupView()
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
    
    private func setupView() {
        guard let trackingButton = trackingButton else {
            print("No tracking button")
            return
        }
        view.addSubview(mapView)
        mapView.addSubview(trackingButton)
    }
    
    private func setupLayout() {
        guard let trackingButton = trackingButton else {
            print("No tracking button")
            return
        }
        
        mapView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        trackingButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset( -30)
            make.bottom.equalToSuperview().offset(-30)
            make.width.height.equalTo(40)
        }
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
