//
//  ViewController.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 18/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let viewModel: ConfigViewModel!
    
    init(viewModel: ConfigViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        //cant use storyboard because it needs custom data(view model)
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .blue
        self.viewModel.fetchConfiguartion()
        self.viewModel.isDataFetched.bind { [weak self] (_) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self?.view.backgroundColor = .systemPink
            }
        }
    }
    


}

