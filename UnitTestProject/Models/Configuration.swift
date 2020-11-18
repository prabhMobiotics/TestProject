//
//  Configuration.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import Foundation

struct Configuration: Decodable {
    let menu: Array<Menu>
    let passwordMinLength: Int
    let passwordMaxLength: Int
}

struct Menu: Decodable {
    let title: String?
    let sectionID: String?
    let type: String?
    let color: String?
    let requireLogin: Bool
    let tabTitle: String?
}
