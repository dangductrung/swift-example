//
//  NavigationManagerType.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation
import UIKit

public protocol NavigationManagerType {
    func visualizeWindow(_ window: UIWindow)
    func navigate2CollectionView(selectedCountry: String) 
    func showListCountry()
    func showReduxEx()
}
