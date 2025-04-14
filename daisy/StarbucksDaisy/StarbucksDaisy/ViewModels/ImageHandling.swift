//
//  ImageHandler.swift
//  StarbucksDaisy
//
//  Created by 원주연 on 4/10/25.
//

import Foundation
import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
