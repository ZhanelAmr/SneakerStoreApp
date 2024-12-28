//
//  TabBarController.swift
//  SneakersStoreAppp
//
//  Created by Zhanel Amralina on 10/15/24.
//

import UIKit

class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().backgroundColor = .white
        tabBar.tintColor = .black
        setupViewControllers()
    }

    func setupViewControllers() {
        viewControllers = [
            wrapInNavigationController(with: CatalogView(), tabTitle: "Catalog", tabImage: UIImage(named: "catalog")!),
            wrapInNavigationController(with: CartViewController(), tabTitle: "Cart", tabImage: UIImage(named: "cart")!),
            wrapInNavigationController(with: ProfileView(), tabTitle: "Profile", tabImage: UIImage(named: "profile")!),
        ]
    }

    func wrapInNavigationController(with rootViewController: UIViewController,
                                    tabTitle: String,
                                    tabImage: UIImage) -> UINavigationController
    {
        let navigationController = UINavigationController(rootViewController: rootViewController)
        navigationController.tabBarItem.title = tabTitle
        navigationController.tabBarItem.image = tabImage
        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationController?.title = tabTitle
        return navigationController
    }
}
