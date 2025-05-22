//
//  StoreAnnotationProvidable.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation

protocol StoreAnnotationProvidable: MapControllable {
    var storeList: [StoreList] { get }
}
