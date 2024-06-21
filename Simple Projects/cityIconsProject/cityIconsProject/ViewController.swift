//
//  ViewController.swift
//  cityIconsProject
//
//  Created by Mustafa DANIŞAN on 30.05.2024.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate , UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!

    // boş landMarkName ve landMarkImage tanımlaması
    var landMarkNames = [String]()
    var landMarkImages = [UIImage]()
    
    // boş seçilmiş landMarkName ve landMarkImage tanımlaması
    var chosenLandMarkName = ""
    var chosenLandMarkImage = UIImage()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Normalde veriler bu şekilde oluşturulmaz şimdilik küçük veriler olduğu için bu şekilde oluşturuldu ...
        
        
        // LandMarkName bilgileri
        landMarkNames.append("Collesseum")
        landMarkNames.append("Great Wall")
        landMarkNames.append("Kremlin")
        landMarkNames.append("Stonehenge")
        landMarkNames.append("Taj Mahal")
        
        // LandMarImage bilgileri
        landMarkImages.append(UIImage(named: "collesium.jpg")!)
        landMarkImages.append(UIImage(named: "greatWall.jpeg")!)
        landMarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landMarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landMarkImages.append(UIImage(named: "tajMahal.jpeg")!)
    }
    
    // tableView de kaç tane eleman olacağını belirleyen fonksiyon
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landMarkNames.count
    }

    // tableView elemanlarının kendisini belirleyen fonksiyon nelerin yazacağını yani
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        content.text = landMarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    // seçilen tableView elemanını başka sayfaya atmak için kullanılan fonksiyon
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandMarkName = landMarkNames[indexPath.row]
        chosenLandMarkImage = landMarkImages[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    // seçilen tableView elemanının bilgilerini başka sayfaya atmak için kullanılan fonksiyon
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // sorgulamayı yapmalıyız ki eğer hata varsa uygulama çökmesin
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVCViewController
            destinationVC.selectedLandMarkName = chosenLandMarkName
            destinationVC.selectedLandMarkImage = chosenLandMarkImage
        }
    }
    
    // tableView deki elemanı silmek için kullanılan fonksiyon
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landMarkNames.remove(at: indexPath.row)
            self.landMarkImages.remove(at: indexPath.row)
            // tableView in görüntüsünden de siliyoruz ki tableView de de silinsin
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}

