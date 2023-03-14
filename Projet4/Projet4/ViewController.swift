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
    
    let customView = CustomUiview()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout1 = createButton(imageName: "Layout1")
        let layout2 = createButton(imageName: "Layout2")
        let layout3 = createButton(imageName: "Layout3")
        
        customView.callback = { status in
            if status == .active {
                print("Appel de la customView")
            }
            else {
                print("Echec")
            }
        }
    }
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    // Accès to photo library
    @IBAction func ImageBtnTapped(_ sender: Any) {
        
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
        
    }
 
    /*
     func createView()
     {
     let layout = UIView()
     currentView.addSubview(layout)
     layout.translatesAutoresizingMaskIntoConstraints = false
     layout.leadingAnchor.constraint(equalTo: currentView.leadingAnchor).isActive = true
     layout.trailingAnchor.constraint(equalTo: currentView.trailingAnchor).isActive = true
     layout.topAnchor.constraint(equalTo: currentView.topAnchor).isActive = true
     layout.bottomAnchor.constraint(equalTo: currentView.bottomAnchor).isActive = true
     layout.backgroundColor = UIColor(named: "colo")
     
     }
     */
    
    func createButton(imageName: String) -> UIButton {
        let button = UIButton(type: .system)
        let image = UIImage(named: imageName)
        customView.isSelected = false
        let originalImage = image?.withRenderingMode(.alwaysOriginal)
        button.setImage(originalImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        currentStackView.addArrangedSubview(button)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        customView.isSelected = true
        let selectedImage = customView.image
        // retrieve the position of button called
        let buttonPosition = sender.convert(sender.bounds.origin, to: currentView)
        customView.image.frame.origin = buttonPosition
        currentStackView.addArrangedSubview(selectedImage)
    
    }
   
   
}
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
