//
//  ImageHandling.swift
//  Starbuck
//
//  Created by 송승윤 on 4/11/25.
//

import UIKit

protocol ImageHandling: AnyObject {
    func addImage(_image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String {get set}
}
