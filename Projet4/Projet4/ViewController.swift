//
//  ViewController.swift
//  Projet4
//
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
    @IBOutlet weak var stackViewButton: UIStackView!
    @IBOutlet weak var button4: UIButton!
    var currentbutton: UIButton?
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
        layout1.type = .type1
        print("hello")
        layout1.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout1.type.button)
        layout1.setUpView()
        layout1.callback = { type in
            
            self.updateMainView(layout: type)
        
        }
        
        let layout2 = LayoutSelectionView()
        layout2.type = .type2
        layout2.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout2.type.button)
        layout2.callback = { type in
            self.updateMainView(layout: type)
        }
        
        let layout3 = LayoutSelectionView()
        layout3.type = .type3
        layout3.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(layout3.type.button)
        layout3.callback = { type in
            self.updateMainView(layout: type)
        }
    }
    
    private func updateMainView(layout: LayoutSelectionView.LayoutType) {
        switch layout {
        case .type1:
         print("hello")
            break
        case .type2: break
        case .type3: break
        }
    }
    /*
    func createButton(imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        let image = UIImage(named: imageName)
       // customView.isSelected = false
        let originalImage = image?.withRenderingMode(.alwaysOriginal)
        button.setImage(originalImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
     */

    
    @objc func buttonTapped(_ sender: UIButton) {

        self.currentbutton? = sender
        // retrieve the position of button called
        let buttonPosition = sender.convert(sender.bounds.origin, to: currentView)
      print("Hey")
    }
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // Acces image and save and image
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            var currentImage = UIImageView()
            stackViewButton.insertArrangedSubview(currentImage, at: currentbutton!.tag)
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
