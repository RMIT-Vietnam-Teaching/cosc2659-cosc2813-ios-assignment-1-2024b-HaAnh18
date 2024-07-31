//
//  CameraView.swift
//  PersonalColor
//
//  Created by Nana on 31/7/24.
//

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
