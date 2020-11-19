//
//  LogInViewController.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 19/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    lazy var loginView = LoginView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        self.view.addSubview(loginView)
        self.view.backgroundColor = .white
        loginView.logInButton.addTarget(self, action: #selector(loginAction), for: .touchDown)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.70)
        ])
    }
    
    @objc private func loginAction() {
        guard let email = loginView.emailTextField.text else {return}
        guard let password = loginView.passwordTextField.text else {return}
        var message = ""
        if email == Constants.demoEmail && password == Constants.demoPassword {
            message = "Login Success"
        } else {
            message = "Login Failed"
        }
        Alert.showAlert(title: "Message", message: message) { [weak self] (alert) in
            self?.present(alert, animated: true, completion: nil)
        }
    }

}
