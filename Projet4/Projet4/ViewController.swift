//
//  ViewController.swift
//  Projet4
//  Created by Lion on 02/03/2023.
//
import Foundation
import UIKit
import PhotosUI

class ViewController: UIViewController {
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var currentStackView: UIStackView!
    let customView = LayoutSelectionView()
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var stackViewButtonTop: UIStackView!
    @IBOutlet weak var stackViewButtonBottom: UIStackView!
    var currentbutton: UIButton?
    var replaceSelectedImage = false
    var selectedImageView: UIImageView?
    var buttonLayout1: UIButton?
    
    // Appel de la fonction UIImagePickerController
    @IBAction func imageBtnTapped(_ sender: UIButton) {
        self.currentbutton = sender
        let photoLibrary = UIImagePickerController()
        photoLibrary.sourceType = .photoLibrary
        photoLibrary.delegate = self
        photoLibrary.allowsEditing = true
        present(photoLibrary, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayoutsButtons()
        
    }
    
    private func initLayoutsButtons() {
        let layout1 = LayoutSelectionView()
        
       
        layout1.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout1)
        layout1.callback = { type in
            
            
            self.updateMainView(layout: type)
            
            
        }
        
        let layout2 = LayoutSelectionView()
        layout2.type = .type2
        layout2.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout2)
        layout2.callback = { type in
            self.updateMainView(layout: type)
            layout2.layer.opacity =  1
        }
        
        let layout3 = LayoutSelectionView()
        layout3.type = .type3
        currentStackView.addArrangedSubview(layout3)
        layout3.translatesAutoresizingMaskIntoConstraints = false
        
        layout3.callback = { type in
            self.updateMainView(layout: type)
            
        }
    }
    
    private func updateMainView(layout: LayoutSelectionView.LayoutType) {
        switch layout {
            
            
            
        case .type1:
                print("Okay")
                
    
            
            button1.isHidden = true
            button3.isHidden = false
            break
        case .type2:
            button1.isHidden = false
            button3.isHidden = true
            break
        case .type3:
            button3.isHidden = false
            button1.isHidden = false
            break
        }
    }
  
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imageTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
        if let imageView = tapGestureRecognizer.view as? UIImageView {
            print("ok")
            let photoLibrary = UIImagePickerController()
            photoLibrary.sourceType = .photoLibrary
            photoLibrary.delegate = self
            photoLibrary.allowsEditing = true
            replaceSelectedImage = true
            selectedImageView = imageView // Save a reference to the selected image view
            
            present(photoLibrary, animated: true)
        }
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            if replaceSelectedImage, let imageView = selectedImageView {
                imageView.image = image // Replace the selected image with the new image
                replaceSelectedImage = false
                selectedImageView = nil
            } else {
                // Add the new image to the stack view
                let currentImage = UIImageView()
                let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
                currentImage.isUserInteractionEnabled = true
                currentImage.addGestureRecognizer(tapGestureRecognizer)
                switch currentbutton!.tag {
                case 1, 2:
                    stackViewButtonTop.insertArrangedSubview(currentImage, at: currentbutton!.tag)
                case 3, 4:
                    stackViewButtonBottom.insertArrangedSubview(currentImage, at: currentbutton!.tag - 3)
                default:
                    break
                }
                currentImage.translatesAutoresizingMaskIntoConstraints = false
                currentImage.image = image
                currentbutton?.isHidden = true
            }
            picker.dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
   
        
    }
}




// Ajouter un geste recognizer pour le swipe 
