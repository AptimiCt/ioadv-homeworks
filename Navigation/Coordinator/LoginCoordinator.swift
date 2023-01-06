//
//  LoginCoordinator.swift
//  Navigation
//
//  Created by Александр Востриков on 22.07.2022.
//

import Foundation
import UIKit
import StorageService

class LoginCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private var navController: UINavigationController
    
    init(navController: UINavigationController) {
        self.navController = navController
    }
    
    func showProfileVC(loginName: String, userService: UserService) {
            let profileViewController = ProfileViewController(loginName: loginName, userService: userService, coordinator: self)
            navController.pushViewController(profileViewController, animated: true)
    }
    
    func showPhotosVC(){
        let nvc = PhotosViewController()
        navController.pushViewController(nvc, animated: true)
    }
}
