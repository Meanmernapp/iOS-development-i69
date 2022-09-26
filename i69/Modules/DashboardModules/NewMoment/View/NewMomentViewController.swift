//
//  NewMomentViewController.swift
//  i69
//
//  Created by The Mac Store on 25/04/2022.
//

import UIKit
import Apollo

class NewMomentViewController: BaseTabBarViewController {
    
    @IBOutlet weak var imProfile: UIImageView!
    @IBOutlet weak var tfMessaeg: UITextField!
    @IBOutlet weak var vPictureBack: UIView!
    @IBOutlet weak var vHeader: UIView!
    @IBOutlet weak var vSwipeUp: UIView!
    @IBOutlet weak var imSelectedPicture: UIImageView!
    
    lazy var imagePicker = UIImagePickerController()
    var fileURL : URL?
    
    @IBAction func btnOpenCamera(_ sender: Any) {
        showImagePickerSheet()
    }
    
    @IBAction func btnShareMemory(_ sender: Any) {
        shareMemory()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
        vPictureBack.addLineDashedStroke(pattern: [8,8], radius: vPictureBack.frame.height, color:UIColor.white.cgColor)
//        imSelectedPicture.isHidden = true
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleGesture))
            swipeUp.direction = .up
            self.view.addGestureRecognizer(swipeUp)
        
        
        
        
        let url = ( StorageHelper.shared.user?.avatarPhotos?.count ?? 0) > 0 ? ( StorageHelper.shared.user?.avatarPhotos?[0]?.url ?? "") : ""
        if url.count > 0
        {
            imProfile.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "profile"))
        }
        
        
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
    }
    @objc func handleGesture(gesture: UISwipeGestureRecognizer) {
//        openCamera()
        showImagePickerSheet()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addHeaderMain(view: vHeader, title: "iSixtynine",SignUpHelper.shared.notificationCount)
    }
    func openCamera()
    {
        let storyView = CustomCameraController()
        storyView.uploadVideo = {data,name,video in
            if video {
                self.fileURL = self.getImageUrlThroughFileName(fileName: "\(name).mp4")
            }
            else {
                self.fileURL = self.getImageUrlThroughFileName(fileName: "\(name).jpeg")
            }
            
            if let image = self.getImageFromURL(fileName: "\(name).jpeg")
            {
                self.imSelectedPicture.image = image
            }
        }
        
        present(storyView, animated: true, completion: nil)
    }

    func shareMemory()
    {
        if let url = self.fileURL
        {
            let message = tfMessaeg.text ?? ""
            if message.count > 0
            {
                let name = "i69_\("".randomString())"
                print(name)
                let file = try! GraphQLFile(fieldName: "file", originalName: "\(name).jpeg",mimeType: "image/jpeg", fileURL: url)
                showLoadingIndicator()
                GraphQLClient.shared.upload(mutation: NewMomentMutation(file: "\(name)", detail: message, userField: StorageHelper.shared.user?.id ?? ""), file: file){(data,error) in
                    self.hideLoadingIndicator()
                    if let error = error {
                        self.showErrorMessage(error.localizedDescription)
                    }
                    else{
                        self.showErrorMessage("Moment share successfully")
                        self.fileURL = nil
                        self.imSelectedPicture.image = nil
                        self.tfMessaeg.text = ""
                    }
                }
                return
            }
            showErrorMessage("please write message")
            
        }
        else
        {
            showErrorMessage("please choose picture to share")
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewMomentViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerSheet() {
        let alert = UIAlertController(title: nil, message: "Upload image from", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .destructive, handler: { _ in
            self.openCamera()
//            self.imagePicker.sourceType = .camera
//            self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Photos", style: .default, handler: { _ in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in

        }))
        self.present(alert, animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        picker.dismiss(animated: true, completion: nil)
        
        if let url = info[.imageURL] as? URL
        {
            print(url)
            self.fileURL = url
            
        }
        if let image = info[.editedImage] as? UIImage {
            self.imSelectedPicture.image = image
//            self.images.append(image)
//            addItem()
        }
    }
}
