//
//  ViewController.swift
//  ProtocolOriantedUIKit
//
//  Created by Vedat Dokuzkardeş on 12.12.2023.
//

import UIKit

class UserViewController: UIViewController, UserViewModelOutput {
    
    func updateView(name: String, email: String, userName: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = userName
        self.emailLabel.text = email
        
    }
    
    
    private let viewModel : UserViewModel
    
    private let nameLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    
    private let usernameLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private let emailLabel :UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        setupViews()
        //fetchUsers()
        viewModel.fetchUsers()
    }
    
    private func setupViews(){
        
        view.backgroundColor = .purple
        
        view.addSubview(nameLabel)
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        
        NSLayoutConstraint.activate(
        [
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
            usernameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10)
            
        ])
    }
    
    /*
    private func fetchUsers(){
        ApiManager.shared.fethUser { result in
            
            switch result{
            case .success(let user):
                self.nameLabel.text = user.name
                self.emailLabel.text = user.email
                self.usernameLabel.text = user.username
                
            case .failure:
                self.nameLabel.text = "No user found"
            }
        }
    }*/
}

