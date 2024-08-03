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
    private let session = AVCaptureSession() // Capture session to manage the camera input and output
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController() // Create a UIViewController instance
        
        #if targetEnvironment(simulator) // Check if the code is running in the simulator set the placeholder-image
        let placeholderImageView = UIImageView(image: UIImage(named: "placeholder-image"))
        placeholderImageView.contentMode = .scaleAspectFill
        placeholderImageView.frame = viewController.view.frame
        viewController.view.addSubview(placeholderImageView)
        #else
        setupSession(viewController: viewController) // Set up the camera session if not running in the simulator
        #endif
        
        return viewController // Return the configured view controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) { }
    
    private func setupSession(viewController: UIViewController) {
        session.beginConfiguration() // Begin configuration of the capture session
        
        let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .front)  // Get the front wide angle camera
        guard let input = try? AVCaptureDeviceInput(device: device!), session.canAddInput(input) else { return }
        session.addInput(input)
        
        session.commitConfiguration()
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)  // Create a preview layer for the capture session
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = viewController.view.frame
        viewController.view.layer.addSublayer(previewLayer)
        
        session.startRunning() // Start the capture session
    }
}
