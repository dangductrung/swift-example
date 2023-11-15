//
//  NavigationManagerImpl.swift
//  test-rxswift
//
//  Created by Trung Dang on 27/07/2023.
//

import Foundation
import UIKit

class NavigationImpl: NavigationManagerType {
    internal var navigationController = UINavigationController()
    
    public func visualizeWindow(_ window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = navigationController
        navigationController.setNavigationBarHidden(false, animated: false)
    }
    
    func showListCountry() {
        let viewController = AddressViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    func navigate2CollectionView(selectedCountry: String) {
        let viewController = TestCollectionViewController(navTitle: selectedCountry)
        DispatchQueue.main.async { [weak self] in
            self?.navigationController.pushViewController(viewController, animated: true)
        }
    }
    
    func showReduxEx() {
        let viewController = ViewController()
        navigationController.setViewControllers([viewController], animated: true)
    }
    
    static let shared = NavigationImpl()
}
