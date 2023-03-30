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
    @IBOutlet weak var currentText: UILabel!
    @IBOutlet var arrayButton: [UIButton]!
    @IBOutlet weak var stackViewButtonTop: UIStackView!
    @IBOutlet weak var stackViewButtonBottom: UIStackView!
    var currentbutton: UIButton?
    var replaceSelectedImage = false
    var selectedImageView: UIImageView?
    var buttonLayout1: UIButton?
    lazy var elements : [LayoutSelectionView] = []
    
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
        detectOrientation()
        let swipeHandleGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipe))
        swipeHandleGesture.direction = .up
        view.addGestureRecognizer(swipeHandleGesture)
        
    }
    
    @objc private func didSwipe() {
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        arrayButton.forEach { element in
            let activity = UIActivityViewController(activityItems: [element.currentImage!], applicationActivities: nil)
            self.present(activity, animated: true, completion: nil)
        }
    }
    
    func detectOrientation() {
        currentText.text = UIDevice.current.orientation.isLandscape ? "Swipe left to share" : "Swipe up to share"
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        detectOrientation()
    }
    
    private func initLayoutsButtons() {
        let layout1 = LayoutSelectionView()
        layout1.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout1)
        layout1.callback = { type in
            self.unSelectLayouts()
            layout1.isSelected = true
            self.updateMainView(layout: type)
        }
        elements.append(layout1)
        
        let layout2 = LayoutSelectionView()
        layout2.type = .type2
        layout2.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout2)
        layout2.callback = { type in
            self.unSelectLayouts()
            layout2.isSelected = true
            self.updateMainView(layout: type)
        }
        
        elements.append(layout2)
        let layout3 = LayoutSelectionView()
        layout3.type = .type3
        currentStackView.addArrangedSubview(layout3)
        layout3.translatesAutoresizingMaskIntoConstraints = false
        
        layout3.callback = { type in
            self.unSelectLayouts()
            layout3.isSelected = true
            self.updateMainView(layout: type)
            
        }
        elements.append(layout3)
        
    }
    func unSelectLayouts() {
        
        elements.forEach { layout in
            layout.isSelected = false
            
        }
    }
    
    private func updateMainView(layout: LayoutSelectionView.LayoutType) {
        switch layout {
            
        case .type1:
            button1.isHidden = true
            button3.isHidden = false
            
        case .type2:
            button1.isHidden = false
            button3.isHidden = true
            
        case .type3:
            button3.isHidden = false
            button1.isHidden = false
            
        }
    }
    
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @objc func imageTapped(_ tapGestureRecognizer: UITapGestureRecognizer) {
        if let imageView = tapGestureRecognizer.view as? UIImageView {
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
                
                self.currentbutton?.setImage(image, for: .normal)
            }
            picker.dismiss(animated: true, completion: nil)
        }
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
}
