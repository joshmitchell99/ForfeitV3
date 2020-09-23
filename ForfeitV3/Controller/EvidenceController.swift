//
//  EvidenceController.swift
//  ForfeitV3
//
//  Created by Josh Mitchell on 9/23/20.
//  Copyright © 2020 Ava Ford. All rights reserved.
//

import UIKit

class EvidenceController: UIViewController {
    
     var brain = ForfeitBrain()
     
     @IBOutlet weak var evidenceImage: UIImageView!
     
     override func viewDidLoad() {
         super.viewDidLoad()
     }
     
     
     // Used https://www.youtube.com/watch?v=yHl1HLUYz-g
     @IBAction func submitButtonPressed(_ sender: UIButton) {
         guard let image = evidenceImage.image,
             let data = image.jpegData(compressionQuality: 1.0) else {
             UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
             return
         }
         
         let imageName = UUID().uuidString
         
         
     }
}


//MARK: - Camera handling. Used this tutorial: https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/WorkWithViewControllers.html#//apple_ref/doc/uid/TP40015214-CH6-SW1

extension EvidenceController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    
    @IBAction func cameraButtonPressed(_ sender: UIButton) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary // CHANGE TO .source WHEN RUNNING THE APP!!!
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    
    // Called by The Man if the user clicks the cancel button
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        // Sets "selectedImage" to the image selected by the user
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Sets evidenceImage on screen to the selected image, then dismisses the photo selection popup
        evidenceImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
}

