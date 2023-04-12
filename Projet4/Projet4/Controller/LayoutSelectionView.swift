//
//  customUiview.swift
//  Projet4
//
//  Created by Lion on 08/03/2023.
//

import UIKit

class LayoutSelectionView: UIView {
    
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
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(handleTapGesture), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        let originalImage = type.image.withRenderingMode(.alwaysOriginal)
        button.setImage(originalImage, for: .normal)
        
        button.contentHorizontalAlignment = .fill
        button.contentVerticalAlignment = .fill
        button.imageView?.contentMode = .scaleAspectFit
        
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.heightAnchor.constraint(equalToConstant: 70),
            button.widthAnchor.constraint(equalToConstant: 70)
            
            
        ])
        
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
            selectedImageView?.isHidden = !isSelected
        }
    }
    
    private func initSelectedImageView() {
        if selectedImageView == nil {
            selectedImageView = UIImageView()
            selectedImageView.contentMode = .scaleAspectFit
            selectedImageView.translatesAutoresizingMaskIntoConstraints = false
            selectedImageView.image = UIImage(named: "Selected")
            addSubview(selectedImageView)
            NSLayoutConstraint.activate([
                selectedImageView.topAnchor.constraint(equalTo: button.topAnchor),
                selectedImageView.bottomAnchor.constraint(equalTo: button.bottomAnchor),
                selectedImageView.leadingAnchor.constraint(equalTo: button.leadingAnchor),
                selectedImageView.trailingAnchor.constraint(equalTo: button.trailingAnchor)
                
            ])
        }
        selectedImageView.isHidden = !isSelected
    }
    
}

extension UIImage {
    func resize(to newSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: newSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: newSize))
        }
    }
}

