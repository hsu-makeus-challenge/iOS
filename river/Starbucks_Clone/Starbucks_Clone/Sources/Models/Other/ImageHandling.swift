//
//  ImageHandling.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 4/10/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
