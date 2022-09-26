//
//  CameraViewController.swift
//  i69
//
//  Created by The Mac Store on 23/04/2022.
//

import UIKit
import AVFoundation


class CustomCameraController: UIViewController, AVCapturePhotoCaptureDelegate, AVCaptureFileOutputRecordingDelegate {
    
    
    
    // MARK: - Variables
    lazy private var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(handleDismiss), for: .touchUpInside)
        button.tintColor = .white
        return button
    }()
    
    lazy private var takePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "capture_photo")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(handleTakePhoto(_:)), for: .touchUpInside)
        return button
    }()
    lazy private var takeVideoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "record.circle.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.tintColor = .red
        button.setImage(UIImage(systemName: "stop.circle.fill")?.withRenderingMode(.alwaysOriginal), for: .selected)
        button.tintColor = .red
        button.addTarget(self, action: #selector(handleCamptureVideo(_:)), for: .touchUpInside)
        return button
    }()
    
    private let photoOutput = AVCapturePhotoOutput()
    private let movieOut = AVCaptureMovieFileOutput()
    
    let captureSession = AVCaptureSession()
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        openCamera()
    }
    
    
    // MARK: - Private Methods
    private func setupUI() {
        
        view.addSubviews(backButton, takePhotoButton,takeVideoButton)
        
        takePhotoButton.makeConstraints(top: nil, left: nil, right: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, topMargin: 0, leftMargin: 0, rightMargin: 0, bottomMargin: 15, width: 80, height: 80)
        takePhotoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        takeVideoButton.makeConstraints(top: nil, left: nil, right: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, topMargin: 0, leftMargin: 0, rightMargin: 200, bottomMargin: 15, width: 120, height: 120)
//        takeVideoButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        backButton.makeConstraints(top: view.safeAreaLayoutGuide.topAnchor, left: nil, right: view.rightAnchor, bottom: nil, topMargin: 15, leftMargin: 0, rightMargin: 10, bottomMargin: 0, width: 50, height: 50)
    }
    
    private func openCamera() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
        case .authorized: // the user has already authorized to access the camera.
            self.setupCaptureSession()
            
        case .notDetermined: // the user has not yet asked for camera access.
            AVCaptureDevice.requestAccess(for: .video) { (granted) in
                if granted { // if user has granted to access the camera.
                    Swift.print("the user has granted to access the camera")
                    DispatchQueue.main.async {
                        self.setupCaptureSession()
                    }
                } else {
                    Swift.print("the user has not granted to access the camera")
                    self.handleDismiss()
                }
            }
            
        case .denied:
            Swift.print("the user has denied previously to access the camera.")
            self.handleDismiss()
            
        case .restricted:
            Swift.print("the user can't give camera access due to some restriction.")
            self.handleDismiss()
            
        default:
            Swift.print("something has wrong due to we can't access the camera.")
            self.handleDismiss()
        }
    }
    private func setupCaptureSession() {
        
        if let captureDevice = AVCaptureDevice.default(for: AVMediaType.video) {
            do {
                let input = try AVCaptureDeviceInput(device: captureDevice)
                if captureSession.canAddInput(input) {
                    captureSession.addInput(input)
                }
            } catch let error {
                Swift.print("Failed to set input device with error: \(error)")
            }
            
            if captureSession.canAddOutput(photoOutput) {
                captureSession.addOutput(photoOutput)
            }
            if captureSession.canAddOutput(movieOut) {
                captureSession.addOutput(movieOut)
            }
            let cameraLayer = AVCaptureVideoPreviewLayer(session: captureSession)
            cameraLayer.frame = self.view.frame
            cameraLayer.videoGravity = .resizeAspectFill
            self.view.layer.addSublayer(cameraLayer)
            
            captureSession.startRunning()
            self.setupUI()
        }
    }
    
    @objc private func handleDismiss() {
        DispatchQueue.main.async {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    var uploadVideo : ((Data,String,Bool)->())?
    @objc private func handleTakePhoto(_ sender:UIButton) {
        let photoSettings = AVCapturePhotoSettings()
        if let photoPreviewType = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
            photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: photoPreviewType]
            photoOutput.capturePhoto(with: photoSettings, delegate: self)
        }
    }
    @objc private func handleCamptureVideo(_ sender:UIButton) {
        
        if sender.isSelected {
            sender.backgroundColor = .clear
            self.movieOut.stopRecording()
        }
        else {
            sender.backgroundColor = .clear
         let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0] as URL
         let filePath = documentsURL.appendingPathComponent("tempMovie.mp4")
        movieOut.startRecording(to: filePath, recordingDelegate: self)
        }
        sender.isSelected = !sender.isSelected
    }
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let dataString = try? Data(contentsOf: outputFileURL) {
        //{
            uploadVideo?(dataString,"",true)
            print("outputfileurl --- \(outputFileURL.absoluteString) --- \(connections.count)")
            dismiss(animated: true)
        }
            
        //}
        print("outputfileurl --- \(outputFileURL.absoluteString) --- \(connections.count)")
    }
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        guard let imageData = photo.fileDataRepresentation() else { return }
//        print("outputfileurl --- \(pho.absoluteString)")
        
        
        let previewImage = UIImage(data: imageData)
        let imageName = "i69_1650748390999"
        if let image = previewImage
        {
            print("saving ------ \(saveImage(image: image,imageName: imageName))")
            
                let imgData = image.jpegData(compressionQuality: 0.5)!
                self.dismiss(animated: true)
                self.uploadVideo?(imgData,imageName,false)
        }
    }
    func saveImage(image: UIImage,imageName : String) -> Bool {
        guard let data = image.jpegData(compressionQuality: 1) ?? image.pngData() else {
            return false
        }
        guard let directory = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) as NSURL else {
            return false
        }
        do {
            print("absoluteString  \(directory.absoluteString ?? "")")
            try data.write(to: directory.appendingPathComponent("\(imageName).jpeg")!)
            return true
        } catch {
            print(error.localizedDescription)
            return false
        }
    }
}
