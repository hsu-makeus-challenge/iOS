//
//  MapControllable.swift
//  Starbucks_Clone
//
//  Created by jaewon Lee on 5/22/25.
//

import Foundation

// View는 구조체이기 때문에 여기서 사용하기 위해서는 AnyObject도 채택해 줘야 컴파일러가 클래스임을 확신하게 됨
protocol MapControllable: Observable, AnyObject {}
