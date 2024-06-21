//
//  ViewController.swift
//  SimpleAlert
//
//  Created by Mustafa DANIŞAN on 28.05.2024.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var password1Text: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func makeAlert (title: String , message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func saveClicked(_ sender: Any) {
        if userNameText.text == "" {
            makeAlert(title: "Errorr !!!", message: "UserName not found")
        }else if password1Text.text == "" {
            makeAlert(title: "Errorr !!!", message: "Password not found")
        }else if password1Text.text != password2Text.text {
            makeAlert(title: "Errorr !!!", message: "Passwords do not match")
        }else {
            makeAlert(title: "Success :)", message: "User OK...")
        }
    }
    
}

