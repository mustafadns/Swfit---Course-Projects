//
//  DetailsVCViewController.swift
//  cityIconsProject
//
//  Created by Mustafa DANIŞAN on 30.05.2024.
//

import UIKit

class DetailsVCViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var landMarkLabel: UILabel!
    
    var selectedLandMarkName = ""
    var selectedLandMarkImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        landMarkLabel.text = selectedLandMarkName
        imageView.image = selectedLandMarkImage
    }

}
