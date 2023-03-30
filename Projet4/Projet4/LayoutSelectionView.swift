//
//  customUiview.swift
//  Projet4
//
//  Created by Lion on 08/03/2023.
//

import UIKit

class LayoutSelectionView: UIView {
    
    static var lastSelectedView: LayoutSelectionView?
    
    var buttonPressed : Bool = false

    enum LayoutType {
        case type1, type2, type3
        
        var image: UIImage {
            switch self {
            case .type1: return UIImage(named: "Layout1")!
            case .type2: return UIImage(named: "Layout2")!
            case .type3: return UIImage(named: "Layout3")!
            }
            
        }
        // Init button + set up UITapGesture
    }
    private var button: UIButton!
    private var selectedImageView: UIImageView!
     var isSelected: Bool = false {
        didSet {
            updateStatus()
        }
    }
    
    var callback: ((LayoutType) -> Void)?
    var type: LayoutType = .type1
    {
        didSet {
            button.setImage(type.image, for: .normal)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
         private  func setUpView() {
    
         button = UIButton(type: .custom)
        button.addTarget(self, action: #selector(handleTapGesture), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        let originalImage = type.image.withRenderingMode(.alwaysOriginal)
        button.setImage(originalImage, for: .normal)
        self.addSubview(button)
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        // Création d'un geste sur un button lorsque le button  sera initialiser dans le viewController
        
        // TODO: Ajouter une tap gesture recognizer pour appeler le call back une fois le self touché
        // TODO: Bonus : Rajouter un retour haptic au tape
    }
    @objc func handleTapGesture(_ sender: UIButton){
        
        callback?(type)
        
        let generator = UIImpactFeedbackGenerator(style: .light)
        generator.prepare()
        generator.impactOccurred()
        
    }
    
    private func updateStatus() {
        if isSelected {
            initSelectedImageView()
        } else {
            // Cacher l'image de selection
            selectedImageView?.isHidden = !isSelected
        }
    }
    
    func getSelectedButton() -> UIButton {
        
        return self.button
    }
    
    private func initSelectedImageView() {
        if selectedImageView == nil {
            selectedImageView = UIImageView()
            selectedImageView.contentMode = .scaleToFill
            selectedImageView.translatesAutoresizingMaskIntoConstraints = false
            selectedImageView.image = UIImage(named: "Selected")
            addSubview(selectedImageView)
            NSLayoutConstraint.activate([
                selectedImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0),
                selectedImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
                selectedImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
                selectedImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
            ])
            
        }
        selectedImageView.isHidden = !isSelected
    }
}
