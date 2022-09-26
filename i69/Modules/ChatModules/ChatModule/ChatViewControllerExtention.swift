//
//  ChatViewControllerExtention.swift
//  i69
//
//  Created by HaiDer's Macbook Pro on 04/06/2022.
//

import Foundation
import UIKit

extension ChatViewController {
    func getChatMessagesSubscription()
    {
        let subscription = GetNewMessagesSubscription(token: SignUpHelper.shared.token)
        self.subscription = Apollo.shared.client2
            .subscribe(subscription: subscription) {  [weak self] result in
                guard let self = self else {
                    return
                }
                GraphQLClient.shared.apollo.clearCache()
                switch result {
                case .success(let graphQLResult):
                    
                    if SignUpHelper.shared.user.id != graphQLResult.data?.onNewMessage?.message?.userId.id ?? "" {
                        if Int(graphQLResult.data?.onNewMessage?.message?.roomId.id ?? "0") == ProfileStorageHelper.shared.newChatId {
                            let data = ChatMessage(content: graphQLResult.data?.onNewMessage?.message?.content ?? "", timeStamp: graphQLResult.data?.onNewMessage?.message?.timestamp ?? "",own: false)
                            self.data.insert(data,at: self.data.count)
                            self.tbChat.reloadData()
                            DispatchQueue.main.async {
                                if self.data.count > 0 {
                                    let indexPath = IndexPath(row: self.data.count-1, section: 0)
                                    self.tbChat.scrollToRow(at: indexPath, at: .bottom, animated: false)
                                    
                                }
                            }
                        }
                        else {
                            print("New message recived")
                        }
                    }
                case .failure(let error):
                    print(error)
                }
            }
        
    }

    func openCamera()
    {
        
        let storyView = CustomCameraController()
        storyView.uploadVideo = {dataFile,nameFile,videoFile in
            if videoFile {
                self.fileURL = self.getImageUrlThroughFileName(fileName: "\(nameFile).mp4")
                self.showLoadingIndicator()
                self.uploadVideo(video: dataFile, name: self.fileURL?.lastPathComponent ?? "file") { fileUrl, success in
                    self.hideLoadingIndicator()
                    let url  = "https://api.chatadmin-mod.click/"
                    if success ?? false {
                        self.presenter?.sendVideoMessage(message: url+(fileUrl ?? ""))
                    }
                    else {
                        self.showErrorMessage("Image upload failed")
                    }
                    
                }
            }
            else {
                self.fileURL = self.getImageUrlThroughFileName(fileName: "\(nameFile).jpeg")
                if let image = self.getImageFromURL(fileName: "\(nameFile).jpeg")
                {
                    self.imSelectedPicture = image
                    self.showLoadingIndicator()
                    self.uploadImage(image: image, name: self.fileURL?.lastPathComponent ?? "file") { fileUrl, success in
                        self.hideLoadingIndicator()
                        let url  = "https://api.chatadmin-mod.click/"
                        if success ?? false {
                            self.presenter?.sendImageMessage(message: url+(fileUrl ?? ""))
                        }
                        else {
                            self.showErrorMessage("Image upload failed")
                        }
                        
                    }
                    
                }
            }
        }
        present(storyView, animated: true, completion: nil)
    }
}

extension ChatViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func showImagePickerSheet() {
        let alert = UIAlertController(title: nil, message: "Upload image from", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { _ in
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
            self.imSelectedPicture = image
            GraphQLClient.shared.apollo.clearCache()
            
            self.uploadImage(image: image, name: self.fileURL?.lastPathComponent ?? "file") { fileUrl, success in
                let url  = "https://api.chatadmin-mod.click/"
                if success ?? false {
                    self.presenter?.sendImageMessage(message: url+(fileUrl ?? ""))
                }
                else {
                    self.showErrorMessage("Image upload failed")
                }
                
            }
            
        }
    }
}
