//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Mustafa DANIŞAN on 1.06.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var controlLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // Tıklama olayından sonra FaceID'yi kullanacak fonksiyon
    @IBAction func sıgnInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you ?") { success, error in
                if success == true {
                    // uccessfuly auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else {
                    // error
                    DispatchQueue.main.async {
                        self.controlLabel.text = "Error !!!"
                    }
                }
            }
        }
        
    }
    
}

