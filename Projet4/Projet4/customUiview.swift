//
//  customUiview.swift
//  Projet4
//
//  Created by Lion on 08/03/2023.
//

import UIKit

class customUiview: UIView {
    

    enum state  {
    
        case pressed, unpressed
    }
    struct Button {
    
        var title : String
        var position : CGPoint
        var size : CGSize
        var state : state
    
    }
    
  
    
    
}
