//
//  UploadViewController.swift
//  FirebaseInstaClone
//
//  Created by Mustafa DANIŞAN on 2.06.2024.
//

import UIKit
import FirebaseStorage
import FirebaseFirestore
import Firebase

class UploadViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var commentText: UITextField!
    @IBOutlet weak var uploadButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Kullanıcı'ya upload yapacağı zaman default olarak upload sayfasına koyulmuş fotoğrafa tıklama iznini vermek için yazılmış kod
        imageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(chooseImage))
        imageView.addGestureRecognizer(gestureRecognizer)
        
    }
    
    // Kullanıcının library'sinden fotoğraf seçebilmesi için yazılmış kod
    @objc func chooseImage () {
        let pickerContoller = UIImagePickerController()
        pickerContoller.delegate = self
        pickerContoller.sourceType = .photoLibrary
        present(pickerContoller, animated: true, completion: nil)
    }
    
     // Seçilen fotoğraf ile ne yapılacağını belirlemek için kullanılan bir fonksiyon
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageView.image = info[.originalImage] as? UIImage
        self.dismiss(animated: true, completion: nil)
    }
    
    // Kod tekrarını önlemek için yazılmış alert fonksiyonu
    func makeAlert (titleInput: String , messageInput: String) {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    

    // Seçilen image'yi, yapılan comment'i ve dateyi dataya kaydetmek için yazılmmış kod
    @IBAction func actionButtonClicked(_ sender: Any) {
        let storage = Storage.storage()
        let storageReferance = storage.reference()
        let mediaFolder = storageReferance.child("media")
        
        if let data = imageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            let imageReferance = mediaFolder.child("\(uuid).jpg")
            imageReferance.putData(data, metadata: nil) { (metadata, error) in
                if error != nil {
                    self.makeAlert(titleInput: "Error!", messageInput: error?.localizedDescription ?? "Error!")
                }else {
                    imageReferance.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            // DATABSE
                            
                            // Database tanımlaması
                            let firestoreDatabase = Firestore.firestore()
                            var firestoreReferance : DocumentReference? = nil
                            
                            // Verilerin database'ye ne isimlerle kaydedileceğini belirleyen kod
                            let firestorePost = ["imageUrl": imageUrl!,"postedBy": Auth.auth().currentUser!.email!,"postComment": self.commentText.text!,"date":FieldValue.serverTimestamp(),"likes":0] as [String : Any]
                            
                            firestoreReferance = firestoreDatabase.collection("Posts").addDocument(data: firestorePost, completion: { error in
                                if error != nil {
                                    self.makeAlert(titleInput: "Error !", messageInput: error?.localizedDescription ?? "Error")
                                }else {
                                    self.imageView.image = UIImage(named: "selected")
                                    self.commentText.text = ""
                                    self.tabBarController?.selectedIndex = 0
                                }
                            })
                            
                        }
                    }
                }
            }
            
        }
    }
    
}
