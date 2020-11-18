//
//  FlowCoordinator.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation
import UIKit

protocol FlowCoordinator {
    var navigationController: UINavigationController { get set }
    var appDIContainer: AppDIContainer { get set}
    func start()
}
