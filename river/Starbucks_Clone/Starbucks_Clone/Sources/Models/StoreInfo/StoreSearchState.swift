//
//  StoreSearchState.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/27/25.
//

import Foundation

struct StoreSearchState {
    var searchType: SearchType = .startedLocation
    var startAddress: String = ""
    var finishAddress: String = ""
}

enum SearchType {
    case startedLocation
    case finishedLocation
}
