//
//  MainCoordinator.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator: FlowCoordinator {
    
    var navigationController: UINavigationController
    var appDIContainer: AppDIContainer
    
    init(navigationVc: UINavigationController, appDIContainer: AppDIContainer) {
        self.navigationController = navigationVc
        self.appDIContainer = appDIContainer
    }

    func start() {
        let vc = ViewController(viewModel: appDIContainer.makeConfigViewModel())
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func displayLoginScreen() {
        let vc = LogInViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
}
