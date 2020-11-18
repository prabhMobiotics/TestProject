//
//  AppDIContainer.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation

//related DIs would go here
class AppDIContainer {
    
    func makeConfigViewModel() -> ConfigViewModel {
        return ConfigViewModel(fetchConfig: FetchDefaultConfiguration())
    }
    
}
