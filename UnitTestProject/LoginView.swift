//
//  LoginView.swift
//  UnitTestProject
//
//  Created by Prabhdeep Singh on 19/11/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class LoginView: UIView {
    
     lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Login Email here"
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.bounds.size.height = 100
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
     lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password here"
        textField.isSecureTextEntry = true
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
     lazy var logInButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        button.setTitle("LogIn", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        //button.addTarget(self, action: #selector(onLoginTap), for: .touchDown)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.spacing = 10
        stackView.isUserInteractionEnabled = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(logInButton)
        setUpConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpConstraints() {
        NSLayoutConstraint.activate([
            
            stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        
            emailTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            
            logInButton.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 10),
            logInButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
    }
    
    
}
