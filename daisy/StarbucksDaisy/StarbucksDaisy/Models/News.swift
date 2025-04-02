//
//  News.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/3/25.
//

import Foundation
import SwiftUI

struct News: Identifiable {
    var id: UUID = UUID()
    var title: String
    var content: String
    var thumbnail: String
}
