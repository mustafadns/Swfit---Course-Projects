//
//  ViewController.swift
//  FirebaseInstaClone
//
//  Created by Mustafa DANIŞAN on 2.06.2024.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uygulama kapatıldıktan sonra kullanıcının hatırlanıp tekrardan giriş yapmaması için kullanıcının nasıl hatırlanacağı ScenceDelegete dosyasının 21-27 satırıncı kodlarında yazılmıştır ...
    }
    
    // Firebase Auth ile giriş yapma entegrasyonu bu kısımda yapılmıştır
    @IBAction func sıgnInClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) { AuthData, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        }else {
            makeAlert(titleInput: "Error", messageInput: "UserName / Password")
        }
    }
    
    
    // Firebase Auth ile kayıt olma entegrasyonu bu kısımda yapılmıştır
    @IBAction func sıgnUpClicked(_ sender: Any) {
        if emailText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { AuthData, error in
                if error != nil {
                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error")
                }else {
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
        } else {
            makeAlert(titleInput: "Error", messageInput: "UserName / Password")
        }
    }
    
    // Kod tekrarını önlemek için Alert sistemi bir fonksiyona tanımlanmıştıtr 
    func makeAlert (titleInput: String, messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okbutton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okbutton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

