//
//  customUiview.swift
//  Projet4
//
//  Created by Lion on 08/03/2023.
//

import UIKit

class LayoutSelectionView: UIView {
    
    enum LayoutType {
        case type1, type2, type3
        
        var image: UIImage {
            switch self {
            case .type1: return UIImage(named: "Layout1")!
            case .type2: return UIImage(named: "Layout2")!
            case .type3: return UIImage(named: "Layout3")!
            }
            
        }
        var button: UIButton {
            var currentButton = UIButton(type: .custom)
            let originalImage = image.withRenderingMode(.alwaysOriginal)
            currentButton.setImage(originalImage, for: .normal)
            return currentButton
        }
    }
    
    private var selectedImageView: UIImageView!
    private var isSelected: Bool = false {
        didSet {
            updateStatus()
        }
    }
    
    var callback: ((LayoutType) -> Void)?
    var type: LayoutType = .type1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpView()
    }
    
    // MARK: - setUp view button layout
    func setUpView() {
        //initSelectedImageView()
        
        //self.addSubview(self.type.button)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        tapGesture.numberOfTapsRequired = 1
        tapGesture.numberOfTouchesRequired = 1
        self.addGestureRecognizer(tapGesture)
        
        // Création d'un geste sur un button lorsque le button  sera initialiser dans le viewController
        
        // TODO: Ajouter une tap gesture recognizer pour appeler le call back une fois le self touché
        // TODO: Bonus : Rajouter un retour haptic au tape
    }
    
    @objc func handleTapGesture(_ gesture: UITapGestureRecognizer){
        
        // Lorsque un boutton est prsser un message sur le terminal devrais apparaître
        print("ok")
        self.callback?(type)
        
    }
    
    private func updateStatus() {
        selectedImageView.isHidden = !isSelected
        if isSelected {
            callback?(type)
            initSelectedImageView()
            // Afficher l'image de selection
        } else {
            // Cacher l'image de selection
            callback?(type)
        }
    }
    
    private func initSelectedImageView() {
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
        selectedImageView.isHidden = !isSelected
    }
    
}
