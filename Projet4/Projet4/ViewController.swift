//
//  ViewController.swift
//  Projet4
//
//  Created by Lion on 02/03/2023.
//
import Foundation
import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    @IBOutlet weak var currentView: UIView!
    
    @IBAction func callBtn(_ sender: Any) {
        createView()
    }
    
    func createView()
    {
        
        let layout = UIView()
        currentView.addSubview(layout)

        layout.translatesAutoresizingMaskIntoConstraints = false
        layout.leadingAnchor.constraint(equalTo: currentView.leadingAnchor).isActive = true
        layout.trailingAnchor.constraint(equalTo: currentView.trailingAnchor).isActive = true
        layout.topAnchor.constraint(equalTo: currentView.topAnchor).isActive = true
        layout.bottomAnchor.constraint(equalTo: currentView.bottomAnchor).isActive = true
        layout.backgroundColor = .blue
        
    }
}
