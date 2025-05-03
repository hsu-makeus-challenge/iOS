//
//  MapView.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/4/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var selectedCoordinate: CLLocationCoordinate2D? = nil
    @State private var cameraCenter: CLLocationCoordinate2D? = nil
    @Bindable private var locationManager: LocationManager
    @Bindable private var storeSelectSheetViewModel: StoreSelectSheetViewModel
    
    init(
        storeSelectSheetViewModel: StoreSelectSheetViewModel,
        locationManager: LocationManager
    ) {
        self.storeSelectSheetViewModel = storeSelectSheetViewModel
        self.locationManager = locationManager
    }

    var body: some View {
        ZStack {
            MapViewRepresentable(
                selectedCoordinate: $selectedCoordinate,
                cameraCenter: $cameraCenter,
                locationManager: locationManager,
                storeSelectSheetViewModel: storeSelectSheetViewModel
            ).ignoresSafeArea()
        }
    }
}
