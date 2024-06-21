//
//  FeedViewController.swift
//  FirebaseInstaClone
//
//  Created by Mustafa DANIŞAN on 2.06.2024.
//

import UIKit
import FirebaseFirestore
import Firebase
import SDWebImage

class FeedViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // Database'deki verileri bir Array'ın içine koymak için tanımlanmış Arraylar
    var userEmailArray = [String]()
    var userCommentArray = [String]()
    var likeArray = [Int]()
    var userImageArray = [String]()
    var documentIdArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        getDataFromFirestore()
    }
    
    // FirebaseFirestore içerisindeki verileri getirmek için yazılmış bir fonksiyon
    func getDataFromFirestore () {
        let fireStoreDatabase = Firestore.firestore()
        // SnapshotListener ile yapmak Firestore'nin en güvenli ve en hızlı yöntemi olduğundan dolayı bu yöntem ile yapıldı
        fireStoreDatabase.collection("Posts").order(by: "date", descending: true).addSnapshotListener { snapshot, error in
            if error != nil {
                print(error?.localizedDescription)
            }else {
                if snapshot?.isEmpty != true && snapshot != nil {
                    
                    // Sayfa her yenilendiğinde datalar birden fazla sürekli sürekli ekrana yazdırılnasın diye her seferinde dataları silmek için yazılmış kodlar
                    self.userImageArray.removeAll(keepingCapacity: false)
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userCommentArray.removeAll(keepingCapacity: false)
                    self.likeArray.removeAll(keepingCapacity: false)
                    self.documentIdArray.removeAll(keepingCapacity: false)
                    
                    // Datadaki verileri tanımlanan Array'lara koymak için yazılmış kodlar
                    for document in snapshot!.documents {
                        let documentID = document.documentID
                        self.documentIdArray.append(documentID)
                        
                        if let postedBy = document.get("postedBy") as? String {
                            self.userEmailArray.append(postedBy)
                        }
                        
                        if let postComment = document.get("postComment") as? String {
                            self.userCommentArray.append(postComment)
                        }
                        
                        if let likes = document.get("likes") as? Int {
                            self.likeArray.append(likes)
                        }
                        
                        if let imageUrl = document.get("imageUrl") as? String {
                            self.userImageArray.append(imageUrl)
                        }
                    }
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    // TableView satır sayısını belirlemek için yazılmış fonksiyon
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userEmailArray.count
    }
    
    // TableView içeriğini ayarlamak için yazılmış fonksiyon
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.userEmailLabel.text = userEmailArray[indexPath.row]
        cell.userImageView.sd_setImage(with: URL(string: self.userImageArray[indexPath.row]))
        cell.commentLabel.text = userCommentArray[indexPath.row]
        cell.likeLabel.text = String(likeArray[indexPath.row])
        
        // DocumentID'sinin gönderilme sebebi her datanın içindeki "like" değerini ayrı ayrı göndermektir
        // ID değerini kullanıcıya hidden'lanan label içerisinden gönderiyoruz ...
        cell.documentIDLabel.text = documentIdArray[indexPath.row]
        return cell
    }

}
