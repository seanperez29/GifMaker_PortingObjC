//
//  UIViewController+Record.swift
//  GifMaker_Swift_Template
//
//  Created by Sean Perez on 10/10/16.
//  Copyright © 2016 Gabrielle Miller-Messner. All rights reserved.
//

import Foundation
import UIKit
import MobileCoreServices

let frameCount = 16
let delayCount: Float = 0.2
let loopCount = 0

extension UIViewController {
    
    @IBAction func launchVideoCamera() {
        let recordVideoController = UIImagePickerController()
        recordVideoController.sourceType = UIImagePickerControllerSourceType.camera
        recordVideoController.mediaTypes = [kUTTypeMovie as String]
        recordVideoController.allowsEditing = false
        recordVideoController.delegate = self
        present(recordVideoController, animated: true, completion: nil)
    }
}

extension UIViewController: UINavigationControllerDelegate {}

extension UIViewController: UIImagePickerControllerDelegate {
    
    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let mediaType = info[UIImagePickerControllerMediaType] as! String
        if mediaType == kUTTypeMovie as String {
            let videoURL = info[UIImagePickerControllerMediaURL] as! URL
            convertVideoToGIF(videoURL: videoURL)
            //UISaveVideoAtPathToSavedPhotosAlbum(videoURL.path, nil, nil, nil)
            dismiss(animated: true, completion: nil)
        }
    }
    
    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func convertVideoToGIF(videoURL: URL) {
        let regift = Regift(sourceFileURL: videoURL, frameCount: frameCount, delayTime: delayCount, loopCount: loopCount)
        let gifURL = regift.createGif()
        displayGif(url: gifURL!)
    }
    
    func displayGif(url: URL) {
        let gifEditorVC = storyboard?.instantiateViewController(withIdentifier: "GifEditorViewController") as! GifEditorViewController
        gifEditorVC.gifURL = url
        navigationController?.pushViewController(gifEditorVC, animated: true)
    }
}
