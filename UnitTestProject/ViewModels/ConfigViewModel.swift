//
//  ConfigViewModel.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation

class ConfigViewModel {
    
    private var configuration: Configuration?
    private var fetchConfig: FetchConfigUseCase
    var isDataFetched = Box(false)
    
    init(fetchConfig: FetchConfigUseCase ) {
        self.fetchConfig = fetchConfig
    }
    
    func fetchConfiguartion() {
        self.fetchConfig.fetchConfiguration { (config, error) in
            if let error = error {
                print("error getting configuration data \(error.localizedDescription)")
                return
            }
            self.configuration = config
            self.isDataFetched.value = true
            //print("Config data is \(self.configuration)")
        }
    }
    
    
    
}
