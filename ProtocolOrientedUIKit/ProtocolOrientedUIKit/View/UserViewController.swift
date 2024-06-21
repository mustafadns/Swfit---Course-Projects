//
//  ViewController.swift
//  ProtocolOrientedUIKit
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import UIKit

// UI ekranının tasarımını yapmak için
class UserViewController: UIViewController, UserViewModelOutput {
    func updateView(name: String, userName: String, email: String) {
        self.nameLabel.text = name
        self.usernameLabel.text = userName
        self.emailLabel.text = email
    }
    
    // ViewModel ' in tanımlanması
    private let viewModel : UserViewModel
    
    // Name Label'inin tanımlanması
    private let nameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // UserName Label'inin tanımlanması
    private let usernameLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // Email Label'inin tanımlanması
    private let emailLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // Zorunlu kod bloğu
    init(viewModel: UserViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    // Zorunlu kod bloğu
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        viewModel.fetchUsers()
    }

    // Ekranı kendimiz oluşturduğumuz için ekran görünüm ayarları
    private func setupViews() {
        view.backgroundColor = .systemGray
        
        view.addSubview(usernameLabel)
        view.addSubview(emailLabel)
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
        
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 60),
            nameLabel.widthAnchor.constraint(equalToConstant: 200),
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            usernameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameLabel.heightAnchor.constraint(equalToConstant: 60),
            usernameLabel.widthAnchor.constraint(equalToConstant: 200),
            usernameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            
            emailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 60),
            emailLabel.widthAnchor.constraint(equalToConstant: 200),
            emailLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 10),
            
        ])
    }
}

