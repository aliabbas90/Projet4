//
//  customUiview.swift
//  Projet4
//
//  Created by Lion on 08/03/2023.
//

import UIKit

class CustomUiview: UIView {
    
    enum Status {
        case active,unactive
    }
    var image: UIImageView {
        let assetImage = UIImage(named: "Selected")
        var currentImage = UIImageView(image: assetImage)
        return currentImage
    }
    var isSelected: Bool = false {
        didSet {
            updateStatus()
        }
    }
    
    var callback: ((Status) -> Void)?
    
    func updateStatus() {
        if isSelected {
            callback?(.active)

        }
        else {
            callback?(.unactive)
        }
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
     if let mycolor = UIColor(named: "colo") {
     layout.backgroundColor = mycolor
     }
     else{
     print("couleur non trouver")
     }
     */
    
    
    
}
