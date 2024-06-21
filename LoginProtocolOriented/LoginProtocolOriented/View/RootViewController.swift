//
//  ViewController.swift
//  LoginProtocolOriented
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import UIKit

class RootViewController: UIViewController, RootViewModelOutput {

    private let viewModel : RootViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemMint
        viewModel.checkLogin()
    }
    
    init(viewModel: RootViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkLogin() {
        if let accessToken = UserDefaults.standard.string(forKey: "ACCESS_TOKEN"), !accessToken.isEmpty {
            showMainApp()
        }else {
            showLogin()
        }
    }
    
    func showMainApp() {
        let mainViewController = MainViewController()
        navigationController?.present(mainViewController, animated: true)
    }
    
    func showLogin() {
        let logInViewController = LogInViewController()
        navigationController?.present(logInViewController, animated: true)
    }


}

