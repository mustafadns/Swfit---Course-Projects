//
//  SettingsViewController.swift
//  FirebaseInstaClone
//
//  Created by Mustafa DANIŞAN on 2.06.2024.
//

import UIKit
import Firebase

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Firebase Auth'dan çıkış yapmak için yazılmış fonksiyon
    @IBAction func logOutClicked(_ sender: Any) {
        do {
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "toViewController", sender: nil)
        }catch {
            print("Error!")
        }
    }
}
