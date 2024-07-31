//
//  CameraView.swift
//  PersonalColor
//
//  Created by Nana on 31/7/24.
//
/*
  RMIT University Vietnam
  Course: COSC2659|COSC2813 iOS Development
  Semester: 2024B
  Assessment: Assignment 1
  Author: Nguyen Tran Ha Anh
  ID: s3938490
  Created date: 31/07/2024
  Last modified: 02/08/2024
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    private let session = AVCaptureSession()
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        
        #if targetEnvironment(simulator)
        let placeholderImageView = UIImageView(image: UIImage(named: "placeholder-image"))
        placeholderImageView.contentMode = .scaleAspectFill
        placeholderImageView.frame = viewController.view.frame
        viewController.view.addSubview(placeholderImageView)
        #else
        setupSession(viewController: viewController)
        #endif
        
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    
    private func setupSession(viewController: UIViewController) {
        session.beginConfiguration()
        
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)
        guard let input = try? AVCaptureDeviceInput(device: device!), session.canAddInput(input) else { return }
        session.addInput(input)
        
        session.commitConfiguration()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = viewController.view.frame
        viewController.view.layer.addSublayer(previewLayer)
        
        session.startRunning()
    }
}
