//
//  FeedCell.swift
//  FirebaseInstaClone
//
//  Created by Mustafa DANIŞAN on 3.06.2024.
//

import UIKit
import FirebaseFirestore

// FeedCell olarak açılan bu dosya TableView içerisine verilerin ayrı ayrı entegrasyonunu yapmak için açılmıştır ...

class FeedCell: UITableViewCell {

    
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIDLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // FirebaseFirestore'deki verinin içerisinde bulunan "like" field'inin değerini değiştirmek için yazılmmış kod
    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        // Değeri birer birer arttırıyor
        if let likeCount = Int(likeLabel.text!) {
            let likeStore = ["likes": likeCount + 1] as [String : Any]
            fireStoreDatabase.collection("Posts").document(documentIDLabel.text!).setData(likeStore, merge: true)
        }

        
    }
}
