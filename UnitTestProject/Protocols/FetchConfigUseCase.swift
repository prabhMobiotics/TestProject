//
//  FetchConfigUseCase.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation

protocol FetchConfigUseCase {
    func fetchConfiguration(completion: @escaping (Configuration?, Error?) -> Void)
}


