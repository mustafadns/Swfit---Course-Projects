//
//  ViewController.swift
//  DarkModeApp
//
//  Created by Mustafa DANIŞAN on 1.06.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chanceMode: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Kullanıcının cihaz seçimindeki seçiminin önemi olmadan uygulamayı sabit light mod olarak ayarlar
        // overrideUserInterfaceStyle = .light
        
        // Kullanıcının cihaz seçimindeki seçiminin önemi olmadan uygulamayı sabit dark mod olarak ayarlar
        // overrideUserInterfaceStyle = .dark
        
    }

    // Sayfaya gir çık yapıldığında modun değişikliğini anlar
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            chanceMode.tintColor = UIColor.white
        }else {
            chanceMode.tintColor = UIColor.black
        }
    }
    
    // Mod değişikliğini anlık olarak otomatik olarak anlar
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            chanceMode.tintColor = UIColor.white
        }else {
            chanceMode.tintColor = UIColor.black
        }
    }

}

