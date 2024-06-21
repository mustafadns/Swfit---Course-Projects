//
//  ViewController.swift
//  ThreadingProject
//
//  Created by Mustafa DANIŞAN on 12.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let urlStrings = ["https://images.pexels.com/photos/3498323/pexels-photo-3498323.jpeg?cs=srgb&dl=pexels-iurii-ivashchenko-1886156-3498323.jpg&fm=jpg","https://images.pexels.com/photos/3774243/pexels-photo-3774243.jpeg?cs=srgb&dl=pexels-souvenirpixels-3774243.jpg&fm=jpg"]
    
    var data = Data()
    var tracker = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) // background thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) // main thread
            }
        }
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(changeImage))
    }
    
    @objc func changeImage () {
        
        if tracker == 0 {
            tracker += 1
        }else {
            tracker -= 1
        }
        
        DispatchQueue.global().async {
            self.data = try! Data(contentsOf: URL(string: self.urlStrings[self.tracker])!) // background thread
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: self.data) // main thread
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "Threding Test"
        return cell
    }

}

